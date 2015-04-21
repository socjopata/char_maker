# -*- encoding : utf-8 -*-
class CharacterShield < ActiveRecord::Base
  include SkillModifierFor
  belongs_to :character
  belongs_to :shield

  def resource
    shield
  end

  def calculate_dexterity_nerf
    dexterity_nerf.present? ? shield_upgrade_modifier = 2 : shield_upgrade_modifier = 0
    skills_modifier = skill_modifier_for("armament,shields", "dexterity_nerf")
    ((skills_modifier + shield_upgrade_modifier) - shield.dexterity_nerf) > 0 ? "-" : ((skills_modifier + shield_upgrade_modifier) - shield.dexterity_nerf)
  end

  def calculate_dexterity_cap
    dexterity_cap.present? ? shield_upgrade_modifier = 2 : shield_upgrade_modifier = 0
    shield.dexterity_cap + shield_upgrade_modifier + skill_modifier_for("armament,shields", "dexterity_cap")
  end

  def required_strength
    required_strength = shield.armament_requirements.detect { |req| req.name=="strength" }.try(:value)
    required_strength.present? ? required_strength : "-"
  end

  def total_defense_bonus(melee=true, options = {})
    if character.wield_style.name=="Styl walki bronią i tarczą"
      upgrade_modifier = defense_bonus.to_i
      shield_special_feature_bonus = (melee ? 0 : resource.ranged_defense_bonus.to_i)

      shield.defense_bonus + upgrade_modifier + shield_special_feature_bonus
    else
      0
    end
  end
end