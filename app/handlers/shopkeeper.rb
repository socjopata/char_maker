# -*- encoding : utf-8 -*-
class Shopkeeper

  attr_reader :character, :weapon_armor_or_shield, :item_to_be_deleted_id
  attr_accessor :purse, :result

  def initialize(character, item_id, item_type, action_type, particular_id = nil)
    @character = character
    @weapon_armor_or_shield = item_type.constantize.find(item_id)
    @item_to_be_deleted_id = particular_id
    @purse = character.session[:coins_left]
    @result = (action_type=="add" ? add : remove)
    @character.update_attribute(:session, @character.session.merge(:coins_left => @purse))
  end


  def add
    _item = "Character#{weapon_armor_or_shield.class.name}".constantize.new(:character_id => character.id)
    _item["#{weapon_armor_or_shield.class.name.tableize.singularize}_id"] = weapon_armor_or_shield.id
    _item.save!
    deduct_money and return _item
  end

  def remove
    _item = "Character#{weapon_armor_or_shield.class.name}".constantize.find(item_to_be_deleted_id)
    _item.destroy
    refund_money(_item) and return _item
  end

  def deduct_money
    @purse -= weapon_armor_or_shield.price #we just add it without upgrades
  end

  def refund_money(inventory_item)
    @purse += evaluate_worth(inventory_item, get_current_upgrades_number(inventory_item)) #case, where we are deleting whole item
  end

  def evaluate_worth(inventory_item, number)
    return weapon_armor_or_shield.price if number.zero?
    case inventory_item.resource.class.name
      when "Weapon"
        weapon_armor_or_shield.price * Weapon::MULTIPLIER[number] + evaluate_worth(inventory_item, (number-1))
      when "RangedWeapon"
        weapon_armor_or_shield.price * RangedWeapon::MULTIPLIER[number] + evaluate_worth(inventory_item, (number-1))
      when "Shield"
        weapon_armor_or_shield.price * Shield::MULTIPLIER[number] + evaluate_worth(inventory_item, (number-1))
      when "Armor"
        Armor::EXTRA_COST_MAP[number] + (weapon_armor_or_shield.is_rare_or_exotic? ? 2 : 1) * evaluate_worth(inventory_item, (number-1))
    end
  end

  def get_current_upgrades_number(inventory_item)
    case inventory_item.resource.class.name
      when "Weapon"
        [inventory_item.damage, inventory_item.speed, inventory_item.attack_bonus, inventory_item.defense_bonus].map(&:to_i).sum
      when "RangedWeapon"
        [inventory_item.damage, inventory_item.speed, inventory_item.attack_bonus, inventory_item.range].map(&:to_i).sum
      when "Shield"
        [inventory_item.defense_bonus, inventory_item.dexterity_nerf, inventory_item.dexterity_cap].map(&:to_i).sum
      when "Armor"
        [inventory_item.defense_bonus, inventory_item.dexterity_nerf, inventory_item.dexterity_cap].map(&:to_i).sum
    end
  end

  def self.says_ok?(character, spendings)
    character.errors.add(:base, "Nie możesz wydać więcej niz posiadasz") if 0 > spendings.to_i
    if self.there_is_chance_to_make_it_smooth(character)
      self.dont_complain_and_make_it_smooth(character)
    else
      character.errors.add(:base, "Wybierz jedną z tarcz jako aktualnie używaną.") if character.character_shields.size > 0 && character.character_shields.map(&:favorite).compact.blank?
      character.errors.add(:base, "Wybierz jedną ze zbroi jako aktualnie noszoną.") if character.character_armors.size > 0 && character.character_armors.map(&:favorite).compact.blank?
    end

    character.errors.blank?
  end

  def self.there_is_chance_to_make_it_smooth(character)
    number_of_shields = character.character_shields.size
    number_of_armors = character.character_armors.size

    if number_of_shields==1 && number_of_armors==1
      return true
    elsif number_of_shields==0 && number_of_armors==1
      return true
    elsif number_of_shields==1 && number_of_armors==0
      return true
    end
    false
  end

  def self.dont_complain_and_make_it_smooth(character)
    character.set_shield_as_main(character.character_shields.first.try(:id))
    character.set_armor_as_main(character.character_armors.first.try(:id))
  end

end

