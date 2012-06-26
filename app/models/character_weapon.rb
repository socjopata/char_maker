# -*- encoding : utf-8 -*-
class CharacterWeapon < ActiveRecord::Base
  belongs_to :character
  belongs_to :weapon

  NOT_FEASIBLE_FOR_DUAL_WIELD = ["Nóż do rzucania", "Lekka Kopia", "Cieżka Kopia", "Lekka"]


  def resource
    weapon
  end

  def name
    resource.name
  end

  #TODO modify it to search for tempo -1 dsl thing s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Wybrana broń, Atak+1, Obrona+1, Tempo-1")  #This "DSL" can be improved
  #start from checking all Tempo-1
  #SkillBonusPreference.preferences_for_character(3)
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
     #TODO test weapon_proficiency_bonus
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

  #TODO extract to module
  def extract_bonus_from_stats_modifier_dsl_definition(type, stats_modifiers)
    if stats_modifiers.present?
      stats_modifiers.select { |sm| sm.group_name[type] }.map { |sm| sm.group_name.match(/(?<=#{type})(.*?)(?=,)/)[0].to_i }.sum + stats_modifiers.select { |sm| sm.group_name["Fechtunek w Grupie Broni"] }.map(&:value).sum
    end
  end

  #this is for weapon group.
  def attack_fencing_parameter
    favorite_weapon_bonus = extract_bonus_from_stats_modifier_dsl_definition("Atak", character.character_skills.map(&:skill_bonus_preference).compact.select { |sbp| sbp.choice==weapon.name }.map { |skill_bonus_preference| skill_bonus_preference.skill.stats_choices.map(&:stats_modifiers) }.flatten.flatten)
    favorite_weapon_group_bonus = extract_bonus_from_stats_modifier_dsl_definition("Atak", character.character_skills.map(&:skill_bonus_preference).compact.select { |sbp| sbp.choice==weapon.group_name }.map { |skill_bonus_preference| skill_bonus_preference.skill.stats_choices.map(&:stats_modifiers) }.flatten.flatten)

    favorite_weapon_bonus.to_i + favorite_weapon_group_bonus.to_i + character.statistics.raw_fencing_when_attacking
  end

  # this is for weapon group.
  def defense_fencing_parameter
    favorite_weapon_bonus = extract_bonus_from_stats_modifier_dsl_definition("Obrona", character.character_skills.map(&:skill_bonus_preference).compact.select { |sbp| sbp.choice==weapon.name }.map { |skill_bonus_preference| skill_bonus_preference.skill.stats_choices.map(&:stats_modifiers) }.flatten.flatten)
    favorite_weapon_group_bonus = extract_bonus_from_stats_modifier_dsl_definition("Obrona", character.character_skills.map(&:skill_bonus_preference).compact.select { |sbp| sbp.choice==weapon.group_name }.map { |skill_bonus_preference| skill_bonus_preference.skill.stats_choices.map(&:stats_modifiers) }.flatten.flatten)

    favorite_weapon_bonus.to_i + favorite_weapon_group_bonus.to_i + character.statistics.raw_fencing_when_defending
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
    #TODO test it. really.
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
