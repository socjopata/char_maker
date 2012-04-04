module CharacterCanUse
  #   @weapon_instance.character_can_use?(character, character.calculate_stats_and_store_them_as_a_hash)
  #   or preferably pass it calculated already

  def character_can_use?(character, statistics_hash)
    armament_requirements.all? { |requirement| requirement.is_met_by?(character, statistics_hash) }
  end

end