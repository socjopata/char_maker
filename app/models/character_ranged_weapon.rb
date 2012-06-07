# -*- encoding : utf-8 -*-
class CharacterRangedWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :ranged_weapon

  def resource
    ranged_weapon
  end

  def shooting_ranges
      #armor_upgrade_modifier = defense_bonus.to_i
      #
      #total_cutting_protection = "#{armor.protection_from_cutting + armor_upgrade_modifier}s"
      #total_piercing_protection = "#{armor.protection_from_piercing + armor_upgrade_modifier}k"
      #total_crushing_protection = "#{armor.protection_from_crushing + armor_upgrade_modifier}o"
      #
      #[total_cutting_protection, total_piercing_protection, total_crushing_protection].compact.join("/")
  end

    #TODO modify it to search for tempo -1 dsl thing s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Wybrana broń, Atak+1, Obrona+1, Tempo-1")  #This "DSL" can be improved
  #start from checking all Tempo-1
  def calculate_speed
    #total_speed = weapon.speed.to_i
    #favorite_weapon_modifier = (character.skills.map(&:name).include?("Ulubiona Broń") && character.skills.detect { |s| s.name=="Ulubiona Broń" }.character_skills.first.skill_bonus_preference.choice==weapon.group_name)
    #fencing_teacher_modifier = (character.skills.map(&:name).include?("Nauczyciel Fechtunku Jednej Broni") && character.skills.detect { |s| s.name=="Nauczyciel Fechtunku Jednej Broni" }.character_skills.first.skill_bonus_preference.choice==weapon.group_name)
    #weapon_upgrade_modifier = speed
    #total_speed -= favorite_weapon_modifier.to_i + fencing_teacher_modifier.to_i + weapon_upgrade_modifier.to_i
    #total_speed < 1 ? 1 : total_speed
  end

  def calculate_damage
     #strength_bonus = Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_s].to_i
     #skill_bonuses = character.statistics.stats_modifiers.select { |sm| sm.modifies=="melee_damage" && (sm.group_name=="All" or sm.group_name=="Except shooting and boxing") }.collect(&:value).sum
     #weapon_upgrade_modifier = damage.to_i
     #
     #total_cutting_dmg = weapon.cutting_dmg.zero? ? nil : "#{weapon.cutting_dmg + strength_bonus + skill_bonuses + weapon_upgrade_modifier }s"
     #total_pierce_dmg = weapon.pierce_dmg.zero? ? nil : "#{weapon.pierce_dmg + strength_bonus + skill_bonuses + weapon_upgrade_modifier }k"
     #total_crushing_dmg = weapon.crushing_dmg.zero? ? nil : "#{weapon.crushing_dmg + strength_bonus + skill_bonuses + weapon_upgrade_modifier }o"
     #[total_cutting_dmg, total_pierce_dmg, total_crushing_dmg].compact.join("/")
  end


  def bonus_from_special_rules

  end

  def weapon_accuracy

  end

  def character_shooting_skill

  end

  def total_hit_chance_parameter
    #parameter_with_bonus_orientation(@character.statistics.calculate_dexterity_bonus)
  end
end
