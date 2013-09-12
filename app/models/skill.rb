# -*- encoding : utf-8 -*-
class Skill < ActiveRecord::Base
  has_many :stats_choices, :as => :resource, :dependent => :destroy
  has_many :skill_requirements, :dependent => :destroy
  has_many :character_skills
  has_many :characters, :through => :character_skills


  scope :basic, where(:profession_type => "default")
  scope :fetch_for_type, lambda { |type| where(:profession_type => type) }
  scope :fetch_for_level, lambda { |level| joins(:skill_requirements).where("skill_requirements.check_applies_to = 'experience' AND  skill_requirements.value = ?", level) }

  #IDEA how about the concept of favorite weapon? Some skills give bonuses to certain weapons and armors.
  #Each skill would give an option to set up something on a screen after skill choice step but before arment step. Favorites would clear if going backwards
  #fetch_caste_skills_for(character)
  #fetch_profession_skills_for(character)

  def self.fetch_caste_skills_for(character)
    case character.profession.general_type
      when "scholar" then
        Skill.fetch_for_type("scholar")
      when "rogue" then
        Skill.fetch_for_type("rogue") + Skill.fetch_for_type("finesse") + Skill.fetch_for_type("shooter")
      when "soldier" then
        Skill.fetch_for_type("soldier") +
            Skill.fetch_for_type(character.fight_style.name=="Finezyjny" ? "finesse" : "brutal") +
            Skill.fetch_for_type("shooter")
    end

  end

  def self.fetch_profession_skills_for(character)
    Skill.fetch_for_type(character.profession.name)
  end

  def to_s
    name
  end

  def self.filter_nonselectable(skills, character, strength, dexterity, endurance, intelligence, faith, polish)
    output = []
    skills.each do |skill|
      output << skill if skill.skill_requirements.any? { |skill_req| skill_req.skill_fails_to_meet_requirements(character, strength, dexterity, endurance, intelligence, faith, polish) }
    end
    output
  end

  def self.change(character, skill, action)
    skillset = Skill.basic + Skill.fetch_caste_skills_for(character) + Skill.fetch_profession_skills_for(character)
    non_selectable_skills_before_change = Skill.filter_nonselectable(skillset.flatten, character, character.statistics.calculate_s, character.statistics.calculate_zr, character.statistics.calculate_wt, character.statistics.calculate_int, character.statistics.calculate_wi, character.statistics.calculate_o)
    action ? skill.add_skill_for(character.id) : skill.substract_skill_from(character.id)
    commander = Commander.new(character.reload, skill, non_selectable_skills_before_change)
    commander.do!
  end

  def self.calculate_free_skill_amount(character, base, intelligence_bonus, used)
    result = base + intelligence_bonus - used - (character.character_background.traits.first.try(:name)=="Amnezja" ? 2 : 0)
    result > 0 ? result : 0
  end


  def add_skill_for(character_id)
    character_skills.create(:character_id => character_id) unless CharacterSkill.exists?(:character_id => character_id, :skill_id => id)
  end

  def substract_skill_from(character_id)
    skill = character_skills.find_by_character_id_and_skill_id(character_id, id)
    skill.present? && skill.destroy
  end

end

