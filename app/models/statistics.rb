class Statistics < ActiveRecord::Base
  set_table_name "statistics"

  serialize :initial_dice_roll_set
  belongs_to :character

  DICE_TYPE = 20 #k20


  def draw_stats
    initial_stats = []
    loop do
      7.times do
        initial_stats << 1 + rand(Statistics::DICE_TYPE)
      end
      initial_stats = initial_stats
      break if initial_stats.sum > 55
    end
    initial_stats = initial_stats.tap{|a| a.delete_at(initial_stats.rindex(initial_stats.min)) } #delete min value from dice roll set
    initial_stats = initial_stats.tap{|a| a.delete_at(initial_stats.rindex(initial_stats.max)) } #delete max value from dice roll set
    initial_stats << 1 + rand(Statistics::DICE_TYPE)    #extra dice roll for polish ("Ogłada"))
    self.initial_dice_roll_set = initial_stats
  end

end

