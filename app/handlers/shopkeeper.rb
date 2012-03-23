class Shopkeeper

  attr_reader :character, :item, :junk_id

  def initialize(character, item_id, item_type, action_type, particular_id = nil)
    @character = character
    @item = item_type.constantize.find(item_id)
    @junk_id = particular_id
    action_type=="add" ? add : remove
  end

  def add
    _item = "Character#{@item.class.name}".constantize.new(:character_id => character.id)
    _item["#{item.class.name.tableize.singularize}_id"] = item.id
    _item.save!
  end

  def remove
    _item = "Character#{@item.class.name}".constantize.find(junk_id)
    _item.destroy
  end


end

