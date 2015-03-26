# -*- encoding : utf-8 -*-
module Stats
  module SharedWeaponCalculationMethods
    def collection_of_stats_modifiers(entity)
      if entity=="weapon_name"
        StatsModifier.bonus_preferences_for(character.id, resource.name)
      elsif entity=="weapon_group_name"
        StatsModifier.bonus_preferences_for(character.id, resource.group_name)
      end
    end

    def extract_bonus_from_stats_modifier_dsl_definition(type, stats_modifiers)
      if stats_modifiers.present?
        sum_of_skill_preference_modifiers_for_weapon_or_weapon_group_specialisation(type, stats_modifiers)
      end
    end

    def sum_of_skill_preference_modifiers_for_weapon_or_weapon_group_specialisation(characteristic_affected, collection_of_stats_modifiers)
      collection_of_stats_modifiers.select { |sm| sm.group_name[characteristic_affected] }.map { |sm| sm.group_name.match(/(?<=#{characteristic_affected})(.*?)(?=,)/)[0].to_i }.sum
    end
  end
end