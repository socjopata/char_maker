# -*- encoding : utf-8 -*-
module CharacterCanUse
  def character_can_use?(character, statistics_hash)
    armament_requirements.all? { |requirement| requirement.is_met_by?(character, statistics_hash) }
  end
end