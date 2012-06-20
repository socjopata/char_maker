# -*- encoding : utf-8 -*-
class ArmamentMaster

  attr_reader :character, :model_class, :group_name, :statistics_hash

  def initialize(character, model, statistics_hash,  opts = {})
    @character = character
    @model_class = model.constantize
    @statistics_hash = statistics_hash
    @group_name = opts.delete(:group_name)
  end

   def prepare_items_collection
      suitable_items = model_class.all.select{|item| item.character_can_use?(character, statistics_hash)}
      available_groups_for_select = suitable_items.map(&:group_name).uniq

      #we get items for the first if it's default filling or respond to user's choice
      group_name.present? ?  appropriate_collection_for_selection = suitable_items.select{|item| item.group_name==group_name} :
          appropriate_collection_for_selection = suitable_items.select{|item| item.group_name==available_groups_for_select.first}

       [appropriate_collection_for_selection, available_groups_for_select]
   end



end


#ArmamentMaster.new(@character, "Weapon", @character.calculate_stats_and_store_them_as_a_hash, {:group_name => nil} )

