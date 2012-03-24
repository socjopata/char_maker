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
    purse - weapon_armor_or_shield.price #we just add it without upgrades
  end

  def refund_money(inventory_item)
    purse + evaluate_worth(inventory_item) #case, where we are deleting whole item
  end

  def evaluate_worth(inventory_item)
    weapon_armor_or_shield.price # + all upgrades
  end

end

