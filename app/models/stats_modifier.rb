# -*- encoding : utf-8 -*-
class StatsModifier < ActiveRecord::Base
  belongs_to :stats_choice
  has_and_belongs_to_many :statistics, class_name: Statistics

  scope :belongs_to_social_class, ->(social_class_id) do
    joins("JOIN stats_choices ON stats_modifiers.stats_choice_id = stats_choices.id
           JOIN social_classes ON stats_choices.resource_id = social_classes.id AND
           stats_choices.resource_type = 'SocialClass' AND social_classes.id = #{social_class_id.to_i}")
  end

  scope :default_for_social_class, ->(social_class_id) do
    belongs_to_social_class(social_class_id).where('stats_modifiers.default_for_social_class IS TRUE')
  end

  scope :must_choose_for_social_class, ->(social_class_id) do
    belongs_to_social_class(social_class_id).where('stats_modifiers.default_for_social_class IS FALSE')
  end

  scope :must_choose_for_origin, ->(country_id) do
    joins('JOIN stats_choices ON stats_modifiers.stats_choice_id = stats_choices.id
        JOIN countries ON stats_choices.resource_id = countries.id').where("stats_modifiers.default_for_origin IS FALSE AND
        stats_choices.resource_type = 'Country' AND
        countries.id = #{country_id.to_i}")
  end

  scope :bonus_preferences_for, ->(char_id, choice_name) do
    joins("join stats_choices ON stats_modifiers.stats_choice_id = stats_choices.id
        join skills ON stats_choices.resource_id = skills.id AND stats_choices.resource_type = 'Skill'
	      join character_skills ON skills.id = character_skills.skill_id AND character_skills.character_id = #{char_id}
        join skill_bonus_preferences ON skill_bonus_preferences.character_skill_id = character_skills.id AND skill_bonus_preferences.choice = '#{choice_name}'")
  end

  scope :of_group, ->(group_name) { where(group_name: group_name) }

  def self.default
    StatsChoice.default.stats_modifiers.first
  end

  def grand_daddy
    stats_choice.resource
  end

  def as_character_skill(character)
    CharacterSkill.find_by_skill_id_and_character_id(grand_daddy.id, character.id)
  end
end