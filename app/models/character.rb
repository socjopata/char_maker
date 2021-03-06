# -*- encoding : utf-8 -*-
class Character < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  belongs_to :fight_style
  belongs_to :wield_style

  has_one :character_background, dependent: :destroy
  has_one :statistics, class_name: Statistics, dependent: :destroy
  has_one :character_profession
  has_one :profession, through: :character_profession
  has_one :purse
  has_one :auxiliary_parameter_set

  has_many :character_skills
  has_many :skills, through: :character_skills
  has_many :character_weapon_proficiencies
  has_many :character_weapons, dependent: :destroy
  has_many :weapons, through: :character_weapons
  has_many :character_armors, dependent: :destroy
  has_many :armors, through: :character_armors
  has_many :character_shields, dependent: :destroy
  has_many :shields, through: :character_shields
  has_many :character_ranged_weapons, dependent: :destroy
  has_many :ranged_weapons, through: :character_ranged_weapons
  has_many :character_spells
  has_many :spells, through: :character_spells

  validates_presence_of :name, :gender, :user_id

  before_save :check_fight_style_choice
  before_create :set_session

  accepts_nested_attributes_for :character_background

  scope :belongs_to_user, ->(user) { where(user_id: user.id) }

  serialize :session, Hash

  def set_session
    self.session = {}
  end

  def any_unfinished_matters_present?
    skill_choices_to_be_precised.any? { |sm| sm.as_character_skill(self).skill_bonus_preference.blank? }
  end

  def skill_choices_to_be_precised
    statistics.stats_modifiers.select { |sm| (sm.group_name.match("Fechtunek w Grupie Broni") ||
        sm.group_name.match("Wybrana broń") ||
        sm.group_name.match("Wybrana tarcza") ||
        sm.group_name.match("Wybrana grupa broni")) }
  end

  def make_rogue_a_finesse_fighter
    update_attribute(:fight_style_id, finesse_fightstyle_id) if rouge?
  end

  def check_fight_style_choice
    if fight_style_id_changed? && style_invalid?
      errors.add(:styl_walki, "jest niepoprawny")
      return false
    end
    true
  end

  def style_invalid?
    brutal_style_misaligned? || finesse_style_misaligned?
  end

  def pick_a_profession(prof_id)
    create_character_profession(profession_id: prof_id)
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

  def valid_for_picking_statistics?
    (all_stats_choices_made.size - all_stats_choices_for_character.size).zero?
  end

  def all_stats_choices_for_character
    @all_stats_choices_for_character ||= social_class_stats_choices +
        character_background.origin.country.stats_choices.where(applies_to: "special").select { |stats_choice| social_class.send(stats_choice.condition.intern) } +
        [default_origin_modifiers_set] + profession.stats_choices
  end

  def all_stats_choices_made
    @all_stats_choices_made ||= statistics.stats_modifiers.collect(&:stats_choice).uniq
  end

  def valid_for_step_fourth?
    statistics.polish >= statistics.initial_dice_roll_set.last.to_i
  end

  def has_valid_shopping_list?(spendings)
    Shopkeeper.says_ok?(self, spendings)
  end

  #traits check
  def valid_stats_assignment?
    if Trait::CHOICE_BREAKERS.include?(character_background.traits.map(&:name).try(:first)) && character_background.traits.first.statistics_it_affects != lead_parameter
      roll_set_without_lead_parameter = statistics.initial_dice_roll_set.tap { |a| a.delete_at(statistics.initial_dice_roll_set[0..4].rindex(statistics.initial_dice_roll_set[0..4].max)) }
      second_highest = roll_set_without_lead_parameter.max
      return (statistics.public_send(Statistics::ENGLISH_NAMES_MAP[character_background.traits.first.statistics_it_affects].intern) == second_highest)
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

    if proficiency.blank? && value == "true" && points_left > 0
      #create proficiency  and decrease a counter
      character_weapon_proficiencies.create!(name: name)
      counter -= 1
    elsif  proficiency.present? && value == "false"
      #delete proficiency and increase a counter
      proficiency.destroy
      counter += 1
    elsif proficiency.blank? && value == "true" && points_left == 0
      #add errors
      errors << "Nie masz wystarczającej liczby punktów do rozdysponowania"
    end
    update_attribute(:session, session.merge(weapon_class_preference_left: counter))
    errors
  end

  def is_of_scholar_class_type?(except = [])
    (Profession::CASTER_CLASSES - Array.wrap(except)).include?(profession.name)
  end

  def is_a_cleric?
    Profession::CLERIC_CLASSES.include?(profession.name)
  end

  def is_a_non_caster?
    Profession::NON_CASTER_CLASSES.include?(profession.name)
  end

  def set_shield_as_main(inventory_item_id)
    character_shields.each do |_shield|
      _shield["id"]==inventory_item_id ? _shield.update_attribute(:favorite, true) : _shield.update_attribute(:favorite, false)
    end if inventory_item_id.present?
  end

  def set_armor_as_main(inventory_item_id)
    character_armors.each do |_armor|
      _armor["id"]==inventory_item_id ? _armor.update_attribute(:favorite, true) : _armor.update_attribute(:favorite, false)
    end if inventory_item_id.present?
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

  def items
    [weapons + armors + shields + ranged_weapons].flatten.map(&:name).join(", ")
  end

  def finish!
    update_attributes(finished: true,
                      free_skill_points_left: Skill.calculate_free_skill_amount(self,
                                                                                session[:skill_free_assignment_base],
                                                                                Statistics::BONUS_OR_PENALTY_RANGES_MAP[statistics.calculate_int].to_i,
                                                                                session[:skills_used].to_i))
    purse.close_the_bill(session[:coins_left])
    complete_the_creation_of_spellbook if is_of_scholar_class_type?
  end

  def complete_the_creation_of_spellbook
    scribe = Scribe.new(self)
    scribe.complete_spellbook
  end

  def valid_for_armament_step?
    !(any_unfinished_matters_present? || is_a_shooter_and_didnt_picked_his_bow_proficiency)
  end

  def is_a_shooter_and_didnt_picked_his_bow_proficiency
    profession.name=="Strzelec" && character_weapon_proficiencies.map(&:name).none? { |group_name| RangedWeapon.all.map(&:group_name).uniq.include?(group_name) }
  end

  private

  def rouge?
    profession.present? && profession.general_type == "rogue"
  end

  def finesse_fightstyle_id
    FightStyle.find_by_name("Finezyjny").id
  end

  def brutal_style_misaligned?
    fight_style.name=="Brutalny" && (statistics.calculate_s < statistics.calculate_zr)
  end

  def finesse_style_misaligned?
    fight_style.name=="Finezyjny" && (statistics.calculate_s > statistics.calculate_zr)
  end
end