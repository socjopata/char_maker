# -*- encoding : utf-8 -*-
class SkillBonusPreference < ActiveRecord::Base
  belongs_to :character_skill

  scope :preferences_for_character, lambda { |char_id|
    joins(:character_skill => :character).
        where("characters.id = ?", char_id)
  }

  def skill
    character_skill.skill
  end

end
