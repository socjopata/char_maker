# -*- encoding : utf-8 -*-
class CharacterArmor < ActiveRecord::Base
  belongs_to :character
  belongs_to :armor

  def resource
    armor
  end

  def protection_levels
    armor_upgrade_modifier = defense_bonus.to_i

    total_cutting_protection = "#{armor.protection_from_cutting + armor_upgrade_modifier}s"
    total_piercing_protection = "#{armor.protection_from_piercing + armor_upgrade_modifier}k"
    total_crushing_protection = "#{armor.protection_from_crushing + armor_upgrade_modifier}o"

    [total_cutting_protection, total_piercing_protection, total_crushing_protection].compact.join("/")
  end

  def calculate_dexterity_nerf
    dexterity_nerf.present? ? armor_upgrade_modifier = 2 : armor_upgrade_modifier = 0
    skills_modifier = character.statistics.stats_modifiers.select { |sm| sm.modifies=="armament,armors" && sm.group_name=="dexterity_nerf" && eval(sm.evaluated_instruction)  }.collect(&:value).sum
    ((skills_modifier + armor_upgrade_modifier) - armor.dexterity_nerf) > 0 ? "-" : ((skills_modifier + armor_upgrade_modifier) - armor.dexterity_nerf)
  end

  def calculate_dexterity_cap
    dexterity_cap.present? ? armor_upgrade_modifier = 3 : armor_upgrade_modifier = 0
    skills_modifier = character.statistics.stats_modifiers.select { |sm| sm.modifies=="armament,armors" && sm.group_name=="dexterity_cap" && eval(sm.evaluated_instruction)  }.collect(&:value).sum
    armor.dexterity_cap + armor_upgrade_modifier + skills_modifier
  end

  def required_strength
    required_strength = armor.armament_requirements.detect { |req| req.name=="strength" }.try(:value)
    required_strength.present? ? required_strength : "-"
  end

end

