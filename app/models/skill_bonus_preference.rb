# -*- encoding : utf-8 -*-
class SkillBonusPreference < ActiveRecord::Base
  belongs_to :character_skill


  def skill
    character_skill.skill
  end

end
