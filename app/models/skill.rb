class Skill < ActiveRecord::Base
  has_many :stats_choices, :as => :resource, :dependent => :destroy
  has_many :skill_requirements, :dependent => :destroy
  has_many :character_skills
  has_many :characters, :through => :character_skills


  scope :basic, where(:profession_type => "default")


  def to_s
    name
  end

end

