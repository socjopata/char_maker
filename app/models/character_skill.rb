# -*- encoding : utf-8 -*-
class CharacterSkill < ActiveRecord::Base
  belongs_to :character
  belongs_to :skill

  set_table_name "character_skills"

  after_create :push_modifiers
  after_destroy :suck_modifiers_back

  #TODO ensure that during translations we are not pushing modifiers if they are already there

  def push_modifiers
    skill.stats_choices.collect(&:stats_modifiers).flatten.each do |modifier|
      character.statistics.stats_modifiers << modifier unless character.statistics.stats_modifiers.exists?(:id => modifier.id)
    end
  end

  def suck_modifiers_back
    #TODO
  end

end