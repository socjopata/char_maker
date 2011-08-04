# -*- encoding : utf-8 -*-
class Statistics < ActiveRecord::Base
  set_table_name "statistics"

  serialize :initial_dice_roll_set
  belongs_to :character

  validates_presence_of :strength, :dexterity, :endurance, :inteligence, :faith, :polish
  #TODO make a validation so user doesn't fill all stats with highest value dice roll.

  DICE_TYPE = 20 #k20


  def draw_stats
    initial_stats = []
    loop do
      7.times do
        initial_stats << 1 + rand(Statistics::DICE_TYPE)
      end
       initial_stats = Statistics.normalize_dice_rolls(initial_stats, self.character.character_background.traits.present? && self.character.character_background.traits.first.name=="Błogosławiony")
       break if initial_stats.sum > 55
    end
    initial_stats << 1 + rand(Statistics::DICE_TYPE)    #extra dice roll for polish ("Ogłada"))
    self.initial_dice_roll_set = initial_stats
  end

  def self.normalize_dice_rolls(roll_set, blessed)
    result = roll_set.tap{|a| a.delete_at(roll_set.rindex(roll_set.min)) } #delete min value from dice roll set
    result = roll_set.tap{|a| a.delete_at(roll_set.rindex(blessed ? roll_set.min : roll_set.max)) } #delete max(or min for special traited) value from dice roll set
  end

end

