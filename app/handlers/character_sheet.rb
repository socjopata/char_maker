# -*- encoding : utf-8 -*-
class CharacterSheet

  include CharacterWizardHelper

  attr_reader :character, :all_skills, :extra_skills, :skill_names, :weapons, :shield, :primary_armor, :secondary_armor, :ranged_weapon, :purse, :scribe

  def initialize(character)
    @character = character
    @all_skills = character.skills
    @extra_skills = Skill.fetch_profession_skills_for(character).select{|skill| @all_skills.include? skill }
    @skill_names = @all_skills.map(&:name)

    @weapons = character.character_weapons
    @shield = character.character_shields.detect {|shield| shield.favorite?}
    @primary_armor = character.character_armors.where(:favorite => true).first
    @secondary_armor =  character.character_armors.where(:favorite => false).first

    @ranged_weapon = character.character_ranged_weapons.first

    @purse =  purse_content(character.purse.base)
    @scribe = Scribe.new(character)
  end


end
