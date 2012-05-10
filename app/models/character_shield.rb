# -*- encoding : utf-8 -*-
class CharacterShield < ActiveRecord::Base
  belongs_to :character
  belongs_to :shield

  def resource
    shield
  end

  def calculate_dexterity_nerf
    dexterity_nerf.present? ? shield_upgrade_modifier = 2 : shield_upgrade_modifier = 0
    skills_modifier = character.statistics.stats_modifiers.select { |sm| sm.modifies=="armament,shields" && sm.group_name=="dexterity_nerf" && eval(sm.evaluated_instruction) }.collect(&:value).sum
    ((skills_modifier + shield_upgrade_modifier) - shield.dexterity_nerf) > 0 ? "-" : ((skills_modifier + shield_upgrade_modifier) - shield.dexterity_nerf)
  end

  def calculate_dexterity_cap
    dexterity_cap.present? ? shield_upgrade_modifier = 2 : shield_upgrade_modifier = 0
    skills_modifier = character.statistics.stats_modifiers.select { |sm| sm.modifies=="armament,shields" && sm.group_name=="dexterity_cap" && eval(sm.evaluated_instruction) }.collect(&:value).sum
    shield.dexterity_cap + shield_upgrade_modifier + skills_modifier
  end

  def required_strength
    required_strength = shield.armament_requirements.detect { |req| req.name=="strength" }.try(:value)
    required_strength.present? ? required_strength : "-"
  end

  def total_defense_bonus(melee=true)
    if character.wield_style.name=="Styl walki bronią i tarczą"

      upgrade_modifier = defense_bonus.to_i
      item_special_feature_bonus = 0 #TODO

      shield.defense_bonus + upgrade_modifier + item_special_feature_bonus
    else
      0
    end

  end

end
