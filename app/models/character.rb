# -*- encoding : utf-8 -*-
class Character < ActiveRecord::Base
  belongs_to :user
  has_one :character_background, :dependent => :destroy
  has_one :statistics, :class_name => "Statistics", :dependent => :destroy

  has_one :character_profession
  has_one :profession, :through => :character_profession
  has_one :purse
  has_one :auxiliary_parameter_set

  has_many :character_skills
  has_many :skills, :through => :character_skills
  belongs_to :fight_style
  has_many :character_weapon_proficiencies

  has_many :character_weapons, :dependent => :destroy
  has_many :weapons, :through => :character_weapons
  has_many :character_armors, :dependent => :destroy
  has_many :armors, :through => :character_armors
  has_many :character_shields, :dependent => :destroy
  has_many :shields, :through => :character_shields
  has_many :character_ranged_weapons, :dependent => :destroy
  has_many :ranged_weapons, :through => :character_ranged_weapons
  #^^ I really considered has-many-through-and-polymorphic-associations here before I started
  # Now i feel the pain.

  mount_uploader :avatar, AvatarUploader
  scope :belongs_to_user, lambda { |user| {:conditions => {:user_id => user.id}} }

  validates_presence_of :name, :gender, :user_id

  before_save :check_fight_style_choice

  accepts_nested_attributes_for :character_background

  def any_unfinished_matters_present?
    skill_choices_to_be_precised.any? { |sm| sm.as_character_skill(self).skill_bonus_preference.blank? }
  end

  def skill_choices_to_be_precised
    statistics.stats_modifiers.select { |sm| (sm.group_name.match("Fechtunek w Grupie Broni") || sm.group_name.match("Wybrana broń") || sm.group_name.match("Wybrana tarcza") || sm.group_name.match("Wybrana grupa broni") )  }
  end

  def make_rogue_a_finesse_fighter
    self.fight_style_id = FightStyle.find_by_name("Finezyjny").id if self.profession.present? && self.profession.general_type=="rogue"
    save(false)
  end

  def check_fight_style_choice
    if fight_style_id_changed? && style_invalid?
      errors.add(:styl_walki, "jest niepoprawny")
      return false
    end
    true
  end

  def style_invalid?
    return true if fight_style.name=="Brutalny" && (statistics.calculate_s < statistics.calculate_zr)
    return true if fight_style.name=="Finezyjny" && (statistics.calculate_s > statistics.calculate_zr)
    false
  end

  def pick_a_profession(prof_id)
    self.create_character_profession(:profession_id => prof_id)
  end

  def social_class_stats_choices
    character_background.social_classes.first.stats_choices
  end

  def social_class
    character_background.social_classes.first
  end

  def default_origin_modifiers_set
    character_background.country.stats_choices.find_by_applies_to(profession.general_type)
  end

  def valid_for_step_three?
    all_stats_choices_for_character = social_class_stats_choices + character_background.origin.country.stats_choices.find_all_by_applies_to("special").select { |stats_choice| social_class.send(stats_choice.condition.intern) } + [default_origin_modifiers_set] + profession.stats_choices
    all_stats_choices_made = statistics.stats_modifiers.collect(&:stats_choice).uniq
    (all_stats_choices_made.size - all_stats_choices_for_character.size).zero?
  end

  def valid_for_step_fourth?
    statistics.polish >= statistics.initial_dice_roll_set.last.to_i
  end

  #traits check
  def valid_stats_assignment?
    if Trait::CHOICE_BREAKERS.include?(character_background.traits.map(&:name).try(:first)) && character_background.traits.first.statistics_it_affects != lead_parameter
      roll_set_without_lead_parameter = statistics.initial_dice_roll_set.tap { |a| a.delete_at(statistics.initial_dice_roll_set[0..4].rindex(statistics.initial_dice_roll_set[0..4].max)) }
      second_highest = roll_set_without_lead_parameter.max
      return (statistics.send(Statistics::ENGLISH_NAMES[character_background.traits.first.statistics_it_affects].intern) == second_highest)
    end
    true
  end

  def current_level
    1 #currently all created chars are starters.
  end

  def toggle_weapon_class_preference(name, value, points_left)
    errors = []
    counter = points_left
    proficiency = character_weapon_proficiencies.find_by_name(name)

    if proficiency.blank? && value=="true" && points_left > 0
      #create proficiency  and decrease a counter
      character_weapon_proficiencies.create(:name => name)
      counter -= 1
    elsif  proficiency.present? && value=="false"
      #delete proficiency and increase a counter
      proficiency.destroy
      counter += 1
    elsif proficiency.blank? && value=="true" && points_left == 0
      #add errors
      errors << "Nie masz wystarczającej liczby punktów do rozdysponowania"
    end
    [counter, errors]
  end

  def is_of_scholar_class_type?
    Profession::CASTER_CLASSES.include?(profession.name)
  end

  def set_shield_as_main(inventory_item_id)
    character_shields.each do |_shield|
      _shield["id"]==inventory_item_id ? _shield.update_attribute(:favorite, true) : _shield.update_attribute(:favorite, false)
    end
  end

  def calculate_stats_and_store_them_as_a_hash
    {
        "strength" => statistics.calculate_s,
        "dexterity" => statistics.calculate_zr,
        "endurance" => statistics.calculate_wt,
        "intelligence" => statistics.calculate_int,
        "faith" => statistics.calculate_wi,
        "polish" => statistics.calculate_o

    }
  end

end


