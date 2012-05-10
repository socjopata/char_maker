# -*- encoding : utf-8 -*-
class Shopkeeper

  attr_reader :character, :weapon_armor_or_shield, :item_to_be_deleted_id
  attr_accessor :purse, :result

  def initialize(character, item_id, item_type, action_type, coins_left, particular_id = nil)
    @character = character
    @weapon_armor_or_shield = item_type.constantize.find(item_id)
    @item_to_be_deleted_id = particular_id
    @purse = coins_left
    @result = (action_type=="add" ? add : remove)
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
        Armor::EXTRA_COST[number] + (weapon_armor_or_shield.is_rare_or_exotic? ? 2 : 1) * evaluate_worth(inventory_item, (number-1))
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
    character.errors.add(:base, "Nie możesz wydać więcej niz posiadasz") if 0 > spendings
    character.errors.add(:base, "Wybierz jedną z tarcz jako aktualnie używaną.") if character.character_shields.size > 0 &&  character.character_shields.map(&:favorite).compact.blank?
    character.errors.add(:base, "Wybierz jedną ze zbroi jako aktualnie noszoną.") if character.character_armors.size > 0 &&  character.character_armors.map(&:favorite).compact.blank?
    character.errors.blank?
  end


end

