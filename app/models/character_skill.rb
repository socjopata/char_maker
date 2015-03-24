# -*- encoding : utf-8 -*-
class CharacterSkill < ActiveRecord::Base
  self.table_name = "character_skills"
  belongs_to :character
  belongs_to :skill

  has_one :skill_bonus_preference, :dependent => :destroy

  after_create :push_modifiers
  after_destroy :suck_modifiers_back

  def push_modifiers
    skill.stats_choices.collect(&:stats_modifiers).flatten.each do |modifier|
      character.statistics.stats_modifiers << modifier unless character.statistics.stats_modifiers.exists?(id: modifier.id)
    end
  end

  def suck_modifiers_back
    skill.stats_choices.collect(&:stats_modifiers).flatten.each do |modifier|
      character.statistics.stats_modifiers.delete(modifier) if character.statistics.stats_modifiers.exists?(id: modifier.id)
    end
  end
end