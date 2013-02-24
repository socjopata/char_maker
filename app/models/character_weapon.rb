# -*- encoding : utf-8 -*-
class CharacterWeapon < ActiveRecord::Base
  include Stats::SharedWeaponCalculationMethods
  belongs_to :character
  belongs_to :weapon

  NOT_FEASIBLE_FOR_DUAL_WIELD = ["Nóż do rzucania", "Lekka Kopia", "Cieżka Kopia", "Lekka"]

  def resource
    weapon
  end

  def name
    resource.name
  end

  def calculate_speed
    total_speed = weapon.speed.to_i

    favorite_weapon_bonus = extract_bonus_from_stats_modifier_dsl_definition("Tempo", collection_of_stats_modifiers("weapon_name"))
    favorite_weapon_group_bonus = extract_bonus_from_stats_modifier_dsl_definition("Tempo", collection_of_stats_modifiers("weapon_group_name"))

    weapon_upgrade_modifier = speed

    total_speed +=  favorite_weapon_bonus.to_i + favorite_weapon_group_bonus.to_i - weapon_upgrade_modifier.to_i    #the orientation is tricky ;)
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
    calculate_attack_bonus_for_particular_weapon + attack_fencing_parameter + character.statistics.calculate_dexterity_and_strength_bonus + weapon_proficiency_bonus
  end

  def calculate_attack_bonus_for_particular_weapon
    weapon_upgrade_modifier = attack_bonus.to_i
    weapon.attack_bonus.to_i + weapon_upgrade_modifier
  end

  def calculate_defense_bonus_for_particular_weapon
    weapon_upgrade_modifier = defense_bonus.to_i
    weapon.defense_bonus.to_i + weapon_upgrade_modifier
  end

  def special_defense_bonus_for_total_defense_listing
    character.statistics.stats_modifiers.select { |sm| sm.modifies=="fighting" && sm.group_name=="Obrona Bliska" }.collect(&:value).sum
  end

  #this is for weapon group.
  def attack_fencing_parameter
    favorite_weapon_bonus = extract_bonus_from_stats_modifier_dsl_definition("Atak", collection_of_stats_modifiers("weapon_name"))
    favorite_weapon_group_bonus = extract_bonus_from_stats_modifier_dsl_definition("Atak", collection_of_stats_modifiers("weapon_group_name"))

    favorite_weapon_bonus.to_i + favorite_weapon_group_bonus.to_i + character.statistics.raw_fencing_when_attacking + fencing_master_modifier
  end

  # this is for weapon group.
  def defense_fencing_parameter
    favorite_weapon_bonus = extract_bonus_from_stats_modifier_dsl_definition("Obrona", collection_of_stats_modifiers("weapon_name"))
    favorite_weapon_group_bonus = extract_bonus_from_stats_modifier_dsl_definition("Obrona", collection_of_stats_modifiers("weapon_group_name"))

    favorite_weapon_bonus.to_i + favorite_weapon_group_bonus.to_i + character.statistics.raw_fencing_when_defending + fencing_master_modifier
  end

  def fencing_master_modifier
    character.character_background.traits.include?(Trait.find_by_name("Fechtmistrz")) ? 5 : 0
  end

  def two_weapons
    rejected = character.character_weapons.select { |character_weapon| NOT_FEASIBLE_FOR_DUAL_WIELD.include?(character_weapon.weapon.name) or character_weapon.weapon.weapon_type=="Dw" }
    character.character_weapons - rejected
  end

  def dual_wield_names
    two_weapons.map(&:name).join(" i ")
  end

  def calculate_defense_bonus_for_dual_wield
    character.skills.map(&:name).include?("Oburęczność") ? two_weapons.map(&:calculate_defense_bonus_for_particular_weapon).sum : two_weapons.map(&:calculate_defense_bonus_for_particular_weapon).first
  end

  def weapon_proficiency_bonus
      character.character_weapon_proficiencies.map(&:name).include?(resource.group_name) ? 0 : -5
  end

  #TODO refactor
  def total_defense(dual_wield, shield=nil)
    if dual_wield
      result = defense_fencing_parameter +
          Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_current_zr].to_i +
          Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_wi].to_i +
          special_defense_bonus_for_total_defense_listing +
          calculate_defense_bonus_for_dual_wield + weapon_proficiency_bonus

    elsif character.wield_style.name=="Styl walki jedną bronią (jednoręczną/dwuręczną)"
      result = defense_fencing_parameter +
          calculate_defense_bonus_for_particular_weapon +
          Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_current_zr].to_i +
          Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_wi].to_i +
          special_defense_bonus_for_total_defense_listing + weapon_proficiency_bonus

    elsif character.wield_style.name=="Styl walki bronią i tarczą"
      result = defense_fencing_parameter +
          calculate_defense_bonus_for_particular_weapon +
          Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_current_zr].to_i +
          Statistics::BONUS_OR_PENALTY_RANGES[character.statistics.calculate_wi].to_i +
          special_defense_bonus_for_total_defense_listing + weapon_proficiency_bonus
      shield.present? ? result = result + shield.total_defense_bonus(true) : result

    end
  end



end
