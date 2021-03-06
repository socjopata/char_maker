# -*- encoding : utf-8 -*-
class Blacksmith
  attr_reader :character, :weapon_armor_or_shield, :improvement_subject_id, :improvement_type, :js_fuck_up
  attr_accessor :purse, :result

  def initialize(character, item_id, item_type, action_type, particular_id, improvement_type)
    @character = character
    @weapon_armor_or_shield = item_type.constantize.find(item_id)
    @improvement_subject_id = particular_id
    @improvement_type = improvement_type
    @purse = character.session[:coins_left]
    @result = (action_type=="improve" ? improve : degrade)
    @character.update_attribute(:session, @character.session.merge(:coins_left => @purse))
  end

  def improve
    _item = find!
    if _item[improvement_type] == true
      @js_fuck_up = true
    else
      _item[improvement_type] = true
      _item.save!
      deduct_money(_item) and return _item
    end
  end

  def degrade
    _item = find!
    if _item[improvement_type] == false
      @js_fuck_up = true
    else
      _item[improvement_type] = false
      _item.save!
      refund_money(_item) and return _item
    end
  end

  def find!
    "Character#{weapon_armor_or_shield.class.name}".constantize.find(improvement_subject_id)
  end

  def deduct_money(inventory_item)
    @purse -= evaluate_improvements_worth(inventory_item)
  end

  def refund_money(inventory_item)
    @purse += evaluate_improvements_worth(inventory_item)
  end

  def evaluate_improvements_worth(inventory_item)
    case inventory_item.resource.class.name
      when "Weapon"
        weapon_armor_or_shield.price * (Weapon::MULTIPLIER_MAP[[inventory_item.damage, inventory_item.speed, inventory_item.attack_bonus, inventory_item.defense_bonus].map(&:to_i).sum+ (caller[0][/`.*'/][1..-2]=="refund_money" ? 1 : 0)]) #   #conditional +1 to ensure we are refunding proper amount
      when "RangedWeapon"
        weapon_armor_or_shield.price * (RangedWeapon::MULTIPLIER_MAP[[inventory_item.damage, inventory_item.speed, inventory_item.attack_bonus, inventory_item.range].map(&:to_i).sum+ (caller[0][/`.*'/][1..-2]=="refund_money" ? 1 : 0)]) #   #conditional +1 to ensure we are refunding proper amount
      when "Shield"
        weapon_armor_or_shield.price * (Shield::MULTIPLIER_MAP[[inventory_item.defense_bonus, inventory_item.dexterity_nerf, inventory_item.dexterity_cap].map(&:to_i).sum+ (caller[0][/`.*'/][1..-2]=="refund_money" ? 1 : 0)]) #   #conditional +1 to ensure we are refunding proper amount
      when "Armor"
        (weapon_armor_or_shield.is_rare_or_exotic? ? 2 : 1) * (Armor::EXTRA_COST_MAP[[inventory_item.defense_bonus, inventory_item.dexterity_nerf, inventory_item.dexterity_cap].map(&:to_i).sum + (caller[0][/`.*'/][1..-2]=="refund_money" ? 1 : 0)])
    end
  end
end