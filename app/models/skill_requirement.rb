class SkillRequirement < ActiveRecord::Base
  belongs_to :skill

  def skill_fails_to_meet_requirements(character, strength, dexterity, endurance, intelligence, faith, polish)
    skills = [strength, dexterity, endurance, intelligence, faith, polish]
    case self.check_applies_to
      when "skill"
        !character.skills.map(&:name).include?(self.name)
      when "statistics"
        (self.name.match /OR:\s/).present? ? (name.gsub("OR: ", "").split(",").none? { |string| self.value.to_i > skills[SkillRequirement::INDEX[string]] }) : (self.value.to_i > skills[SkillRequirement::INDEX[self.name]])
      when "experience"
        true #currently all characters are 1 lvl, so..
      when "social_class"
        !character.social_class.send(self.name.intern)
      when "caster_class"
        !Profession::CASTER_CLASSES.include?(character.profession.name)
      when "auxiliary"
        self.value.to_i > character.statistics.send("calculate_#{AuxiliaryParameterSet::ENGLISH_NAMES[name]}".intern)
    end
  end


  INDEX = {"S" => 0,
           "ZR" => 1,
           "WT" => 2,
           "INT" => 3,
           "WI" => 4,
           "O" => 5

  }

end
