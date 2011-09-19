# -*- encoding : utf-8 -*-
class Statistics < ActiveRecord::Base
  set_table_name "statistics"

  serialize :initial_dice_roll_set
  belongs_to :character
  has_and_belongs_to_many :stats_modifiers

  validates_presence_of :strength, :dexterity, :endurance, :inteligence, :faith, :polish

  attr_accessor :double_skill_free_assignment

  DICE_TYPE = 20 #k20

  NAMES =
      {"S" => "Siła",
       "ZR" => "Zręczność",
       "WT" => "Wytrzymałość",
       "INT" => "Inteligencja",
       "WI" => "Wiara",
       "O" => "Ogłada"
      }


  # User has to choose a dice roll for ogłada or can exchange it with other as long as it is higher than default.

  def draw_stats
    initial_stats = []
    loop do
      7.times do
        initial_stats << 1 + rand(Statistics::DICE_TYPE)
      end
      initial_stats = Statistics.normalize_dice_rolls(initial_stats, self.character.character_background.traits.present? && self.character.character_background.traits.first.name=="Błogosławiony")
      break if initial_stats.sum > 55
      initial_stats = []
    end
    initial_stats << 1 + rand(Statistics::DICE_TYPE) #extra dice roll for polish ("Ogłada"))
    self.initial_dice_roll_set = initial_stats
  end

  def self.normalize_dice_rolls(roll_set, blessed)
    result = roll_set.tap { |a| a.delete_at(roll_set.rindex(roll_set.min)) } #delete min value from dice roll set
    result = roll_set.tap { |a| a.delete_at(roll_set.rindex(blessed ? roll_set.min : roll_set.max)) } #delete max(or min for special traited) value from dice roll set
  end

  def push_social_class_stats_modifiers(params)
    push_stats(params)
  end

  def push_origin_stats_modifiers(params)
    push_stats(params)
  end

  def push_stats(params)
    if params.present?
      modifiers = []
      modifiers << StatsChoice.find_all_by_id(params.keys).collect(&:stats_modifiers)
      modifiers.flatten.each do |modifier|
        self.stats_modifiers << modifier unless self.stats_modifiers.exists?(:id => modifier.id)
      end
    end
  end

  def push_profession_modifiers
    modifiers = []
    modifiers << character.profession.stats_choices.collect(&:stats_modifiers)
    modifiers.flatten.each do |modifier|
      self.stats_modifiers << modifier unless self.stats_modifiers.exists?(:id => modifier.id)
    end
    modifiers.flatten.select{|modifier| modifier.modifies=="skills"}.collect(&:group_name) #return skills on exit
  end

  def grant_free_skill_assignments_if_applicable
    #TODO
    throw stats_modifiers
  end

end

