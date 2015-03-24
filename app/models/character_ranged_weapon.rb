# -*- encoding : utf-8 -*-
class CharacterRangedWeapon < ActiveRecord::Base
  include Stats::SharedWeaponCalculationMethods

  belongs_to :character
  belongs_to :ranged_weapon

  def resource
    ranged_weapon
  end

  def shooting_ranges
    close, medium, long = resource.range.split('/')

    total_close = close.to_i + (range.present? ? 25 : 0)
    total_medium = medium.to_i + (range.present? ? 25 : 0)
    total_long = long.to_i + (character.skills.map(&:name).include?("Odległość nie ma Znaczenia") ? 25 : 0 )

    [total_close, total_medium, total_long].compact.join("/")
  end

  def calculate_speed
    total_speed = resource.speed.to_i
    favorite_weapon_bonus = extract_bonus_from_stats_modifier_dsl_definition("Tempo", collection_of_stats_modifiers("weapon_name"))
    favorite_weapon_group_bonus = extract_bonus_from_stats_modifier_dsl_definition("Tempo", collection_of_stats_modifiers("weapon_group_name"))

    weapon_upgrade_modifier = speed
    skill_modifiers = character.statistics.stats_modifiers.select { |sm| sm.modifies=="weapon_modifier" && (sm.group_name=="Bow speed") }.collect(&:value).sum
    total_speed -= - favorite_weapon_bonus.to_i - favorite_weapon_group_bonus.to_i + weapon_upgrade_modifier.to_i + skill_modifiers.to_i #the orientation is tricky ;)
    total_speed < 1 ? 1 : total_speed
  end

  def calculate_damage
    strength_bonus = Statistics::BONUS_OR_PENALTY_RANGES_MAP[character.statistics.calculate_s].to_i
    skill_bonuses = character.statistics.stats_modifiers.select { |sm| sm.modifies=="melee_damage" && (sm.group_name=="All" or sm.group_name=="Ranged") }.collect(&:value).sum
    weapon_upgrade_modifier = damage.to_i

    crossbow_bonus = 0
    unless resource.is_a_bow?
      crossbow_bonus += character.statistics.stats_modifiers.select { |sm| sm.modifies=="melee_damage" && (sm.group_name=="Crossbows") }.collect(&:value).sum
      crossbow_bonus += damage.to_i #we add it again for that extra point
    end

    total_dmg = "#{strength_bonus + weapon_upgrade_modifier + resource.dmg + crossbow_bonus + skill_bonuses }#{resource.dmg_type}"
  end

  def bonus_from_special_rules
    0
  end

  def weapon_accuracy
    attack_bonus.to_i + resource.accuracy_bonus.to_i
  end

  def character_shooting_skill
    character.statistics.raw_shooting
  end

  def total_hit_chance_parameter
    bonus_from_special_rules + weapon_accuracy + character_shooting_skill + character.statistics.calculate_dexterity_bonus
  end
end