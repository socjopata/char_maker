# -*- encoding : utf-8 -*-
class Statistics < ActiveRecord::Base

  include Stats::Main
  include Stats::Auxiliary
  include Stats::Fencing
  include Stats::Brawl
  include Stats::RangeChange
  include Stats::Scholar

  set_table_name "statistics"

  serialize :initial_dice_roll_set
  belongs_to :character
  has_and_belongs_to_many :stats_modifiers

  validates_presence_of :strength, :dexterity, :endurance, :intelligence, :faith, :polish

  DICE_TYPE = 20 #k20

  POLISH_NAMES =
      {"S" => "Siła",
       "ZR" => "Zręczność",
       "WT" => "Wytrzymałość",
       "INT" => "Inteligencja",
       "WI" => "Wiara",
       "O" => "Ogłada"
      }

  ENGLISH_NAMES =
      {"S" => "strength",
       "ZR" => "dexterity",
       "WT" => "endurance",
       "INT" => "intelligence",
       "WI" => "faith",
       "O" => "polish"
      }

  BONUS_OR_PENALTY_RANGES = RangedHash.new(
      1..3 => "-3",
      4..6 => "-2",
      7..9 => "-1",
      10..12 => "+0",
      13..15 => "+1",
      16..18 => "+2",
      19..21 => "+3",
      22..24 => "+4",
      25..27 => "+5",
      28..30 => "+6",
      31..33 => "+7",
      34..36 => "+8",
      37..39 => "+9",
      40..42 => "+10",
      43..45 => "+11",
      46..48 => "+12",
      49..51 => "+13"
  )

  def draw_stats
    initial_stats = []
    loop do
      7.times do
        initial_stats << 1.d(Statistics::DICE_TYPE)
      end
      initial_stats = Statistics.normalize_dice_rolls(initial_stats, character.character_background.traits.first.try(:name) =="Błogosławiony")
      break if initial_stats.sum > 55
      initial_stats = []
    end
    initial_stats << (character.character_background.traits.first.try(:name)=="Piękniś" ? 25 : (1.d(Statistics::DICE_TYPE))) #extra dice roll for polish ("Ogłada"))
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
    modifiers.flatten.select { |modifier| modifier.modifies=="skills" }.collect(&:group_name) #return skills on exit
  end


  def convert_stat_choices_to_skills

    skill_names_array = stats_modifiers.select { |sm| sm.modifies=="skills" }.collect { |sm| sm.group_name.split("oraz").collect { |name| name.strip } }.flatten
    free_skill_counter = skill_names_array.select { |name| name=="Jedna wolna umiejętność" }.size
    skill_names_array.delete("Jedna wolna umiejętność") if skill_names_array.include?("Jedna wolna umiejętność")
    free_skill_counter = free_skill_counter + (skill_names_array.size - skill_names_array.uniq.size) #if there are doubles...

    skill_free_assignment_base = free_skill_counter + character.profession.skill_points


    skills = Skill.find_all_by_name(skill_names_array.uniq)
    skills.each do |skill|
      skill.character_skills.create(:character_id => character.id)
    end

    default_skills_ids = skills.map(&:id)

    [skill_free_assignment_base, default_skills_ids]
  end

  def calculate_weapon_class_proficiencies_points
    character.profession.starting_weapon_proficiency + stats_modifiers.select { |sm| sm.modifies=="fighting" && sm.group_name=="Biegłość w Grupie Broni" }.collect(&:value).sum
  end


end


