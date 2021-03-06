# -*- encoding : utf-8 -*-
class SkillRequirement < ActiveRecord::Base
  INDEX_MAP = { "S" => 0,
            "ZR" => 1,
            "WT" => 2,
            "INT" => 3,
            "WI" => 4,
            "O" => 5

  }
  belongs_to :skill

  def skill_fails_to_meet_requirements(character, strength, dexterity, endurance, intelligence, faith, polish)
    skills = [strength, dexterity, endurance, intelligence, faith, polish]
    case check_applies_to
      when "skill"
        !character.skills.map(&:name).include?(name)
      when 'statistics'
        (name.match /OR:\s/).present? ?
            (name.gsub("OR: ", "").split(",").reject { |string| value.to_i > skills[SkillRequirement::INDEX_MAP[string]] }.size.zero?) :
            (value.to_i > skills[SkillRequirement::INDEX_MAP[name]])
      when "experience"
        true #currently all characters are 1 lvl, so..
      when "social_class"
        !character.social_class.send(name.intern)
      when "caster_class"
        !Profession::CASTER_CLASSES.include?(character.profession.name)
      when "auxiliary"
        value.to_i > character.statistics.send("calculate_#{AuxiliaryParameterSet::ENGLISH_NAMES_MAP[name]}".intern)
      when "fighting"
        value.to_i > character.statistics.send(name.intern)
    end
  end

  def make_human_readable
    case check_applies_to
      when "skill"
        "* Umiejętność #{(name)}"
      when "statistics"
        (name.match /OR:\s/).present? ? "* Jeden z Parametrów, #{name.gsub("OR: ", "").split(",").join(" lub ")} powinien mieć wartość conajmniej #{value.to_i}" : "* Parametr #{Statistics::POLISH_NAMES_MAP[name]} musi mieć wartość conajmniej #{value.to_i}"
      when "experience"
        "* Poziom doświadczenia: #{value}"
      when "social_class"
        "* Postać musi mieć odpowiednie pochodzenie. Zerknij do podręcznika"
      when "caster_class"
        "* Postać musi być Posiadaczem Mocy"
      when "auxiliary"
        "* Paramter #{name} musi wynosić conajmniej #{value.to_i}"
    end
  end
end