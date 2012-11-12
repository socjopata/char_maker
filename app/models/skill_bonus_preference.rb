# -*- encoding : utf-8 -*-
class SkillBonusPreference < ActiveRecord::Base
  belongs_to :character_skill

  scope :for_character, lambda { |char_id|
    joins(:character_skill => :character).
        where("characters.id = ?", char_id)
  }

  scope :for_character_choice, lambda { |char_id, choice_name|
    joins(:character_skill => :character).
        where("characters.id = ? AND skill_bonus_preferences.choice = ?", char_id, choice_name )
  }


  def skill
    character_skill.skill
  end

end
