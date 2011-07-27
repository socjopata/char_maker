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
    #TODO make it work ;)
    #  initial_stats = initial_stats.delete_if {|element| element==initial_stats.max or element==initial_stats.min}
      break if initial_stats.sum > 55
    end
    initial_stats << 1 + rand(Statistics::DICE_TYPE)  #additional throw for "polish" ("Ogłada")
    self.initial_dice_roll_set = initial_stats

  end

end

