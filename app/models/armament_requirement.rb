# -*- encoding : utf-8 -*-
class ArmamentRequirement < ActiveRecord::Base
  belongs_to :resource, polymorphic: true

  def is_met_by?(character, statistics_hash)
    case check_applies_to
      when 'statistics'
        value.to_i <= statistics_hash[name]
      when 'fightstyle'
        character.fight_style.name == name
      when 'modified_stat'
        value.to_i <= character.statistics.public_send(name.intern)
      when 'social_class'
        character.social_class.public_send(name.intern)
      when 'origin'
        character.character_background.country.name == name
    end
  end
end