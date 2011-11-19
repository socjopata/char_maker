class Skill < ActiveRecord::Base
  has_many :stats_choices, :as => :resource, :dependent => :destroy
  has_many :skill_requirements, :dependent => :destroy
  has_many :character_skills
  has_many :characters, :through => :character_skills


  scope :basic, where(:profession_type => "default")


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
    action ? skill.add_skill_for(character.id) : skill.substract_skill_from(character.id)
    commander = Commander.new(character.reload, skill)
    commander.do!
  end

  def add_skill_for(character_id)
    character_skills.create(:character_id => character_id) unless CharacterSkill.exists?(:character_id => character_id, :skill_id => id)
  end

  def substract_skill_from(character_id)
    skill = character_skills.find_by_character_id_and_skill_id(character_id, id)
    skill.present? && skill.destroy
  end

end

