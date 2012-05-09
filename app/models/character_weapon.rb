# -*- encoding : utf-8 -*-
class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :weapon

  def resource
    weapon
  end

  def calculate_range

  end

  #TODO modify it to search for tempo -1 dsl thing s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Wybrana broń, Atak+1, Obrona+1, Tempo-1")  #This "DSL" can be improved
  def calculate_speed
    total_speed = weapon.speed.to_i
    favorite_weapon_modifier = (character.skills.map(&:name).include?("Ulubiona Broń") && character.skills.detect { |s| s.name=="Ulubiona Broń" }.character_skills.first.skill_bonus_preference.choice==weapon.group_name)
    fencing_teacher_modifier = (character.skills.map(&:name).include?("Nauczyciel Fechtunku Jednej Broni") && character.skills.detect { |s| s.name=="Nauczyciel Fechtunku Jednej Broni" }.character_skills.first.skill_bonus_preference.choice==weapon.group_name)
    weapon_upgrade_modifier = speed
    total_speed -= favorite_weapon_modifier.to_i + fencing_teacher_modifier.to_i + weapon_upgrade_modifier.to_i
    total_speed < 1 ? 1 : total_speed
  end

  def calculate_damage
    strength_bonus = Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_s].to_i
    skill_bonuses = character.statistics.stats_modifiers.select { |sm| sm.modifies=="melee_damage" && (sm.group_name=="All" or sm.group_name=="Except shooting and boxing") }.collect(&:value).sum
    weapon_upgrade_modifier = damage.to_i

    total_cutting_dmg = weapon.cutting_dmg.zero? ? nil : "#{weapon.cutting_dmg + strength_bonus + skill_bonuses + weapon_upgrade_modifier }s"
    total_pierce_dmg = weapon.pierce_dmg.zero? ? nil : "#{weapon.pierce_dmg + strength_bonus + skill_bonuses + weapon_upgrade_modifier }k"
    total_crushing_dmg = weapon.crushing_dmg.zero? ? nil : "#{weapon.crushing_dmg + strength_bonus + skill_bonuses + weapon_upgrade_modifier }o"
    [total_cutting_dmg, total_pierce_dmg, total_crushing_dmg].compact.join("/")
  end

  def hit_parameter
    calculate_attack_bonus + attack_fencing_parameter + character.statistics.calculate_dexterity_and_strength_bonus
  end

  #this is for particular weapon.
  def calculate_attack_bonus
    weapon_upgrade_modifier = attack_bonus.to_i
    weapon.attack_bonus.to_i + weapon_upgrade_modifier
  end

  def calculate_defense_bonus
    weapon_upgrade_modifier = defense_bonus.to_i
    weapon.defense_bonus.to_i + weapon_upgrade_modifier
  end

  #TODO extract to module
  def extract_bonus_from_stats_modifier_dsl_definition(type, stats_modifiers)
    if stats_modifiers.present?
      stats_modifiers.select { |sm| sm.group_name[type] }.map { |sm| sm.group_name.match(/(?<=#{type})(.*?)(?=,)/)[0].to_i }.sum
    end
  end

  #and this is for weapon group.
  def attack_fencing_parameter
    favourite_weapon_bonus = extract_bonus_from_stats_modifier_dsl_definition("Atak", character.character_skills.map(&:skill_bonus_preference).compact.select { |sbp| sbp.choice==weapon.name }.map { |skill_bonus_preference| skill_bonus_preference.skill.stats_choices.map(&:stats_modifiers) }.flatten.flatten)
    favourite_weapon_group_bonus = extract_bonus_from_stats_modifier_dsl_definition("Atak", character.character_skills.map(&:skill_bonus_preference).compact.select { |sbp| sbp.choice==weapon.group_name }.map { |skill_bonus_preference| skill_bonus_preference.skill.stats_choices.map(&:stats_modifiers) }.flatten.flatten)
    overall_fencing_bonus = character.statistics.stats_modifiers.select { |sm| sm.modifies=="fighting" && (sm.group_name["Fechtunek postaci zwiększony będzie o"]) }.collect(&:value).sum
    profession_base_parameter = character.profession.attack

    favourite_weapon_bonus + favourite_weapon_group_bonus + overall_fencing_bonus + profession_base_parameter
  end

  def defense_fencing_parameter

  end


end
