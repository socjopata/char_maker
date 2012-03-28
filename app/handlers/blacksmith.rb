class Blacksmith

  attr_reader :character, :weapon_armor_or_shield, :improvement_subject_id, :improvement_type
  attr_accessor :purse, :result

  def initialize(character, item_id, item_type, action_type, coins_left, particular_id, improvement_type)
    @character = character
    @weapon_armor_or_shield = item_type.constantize.find(item_id)
    @improvement_subject_id = particular_id
    @improvement_type = improvement_type
    @purse = coins_left
    @result = (action_type=="improve" ? improve : degrade)
  end

  def improve
      _item = find!
      _item[improvement_type] = true
      _item.save!
      deduct_money(_item)  and return _item
  end

  def degrade
    _item = find!
    _item[improvement_type] = false
    _item.save!
    refund_money(_item) and return _item
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

  #TODO broken, debug it

  def evaluate_improvements_worth(inventory_item)
    case inventory_item.resource.class.name
      when "Weapon"
        weapon_armor_or_shield.price * (Weapon::MULTIPLIER[[inventory_item.damage, inventory_item.speed, inventory_item.attack_bonus, inventory_item.defense_bonus].map(&:to_i).sum+ (caller[0][/`.*'/][1..-2]=="refund_money" ? 1 : 0)]  )  #   #conditional +1 to ensure we are refunding proper amount
      when "RangedWeapon"
        #TODO
      when "Shield"
        #TODO
      when "Armor"
        #TODO
    end
  end

end