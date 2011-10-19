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

end

