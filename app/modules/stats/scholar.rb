# -*- encoding : utf-8 -*-

module Stats
  module Scholar

    def calculate_mana_points
      if character.is_a_cleric?
        calculate_wi + (calculate_int.to_f/2).ceil + (character.current_level * 1) + character.current_level.d(10) + mana_bonuses_from_skills
      else
        calculate_int + (calculate_wi.to_f/2).ceil + (character.current_level * 1) + character.current_level.d(10) + mana_bonuses_from_skills
      end
    end

    def mana_bonuses_from_skills
      bonuses = stats_modifiers.select { |sm| sm.modifies=="power level" }
      evaluated_bonuses = bonuses.select { |sm| sm.value==0 }.map { |sm| sm.split("k").first.to_i.d(sm.split("k").last.to_i) }.collect(&:value).sum
      evaluated_bonuses + bonuses.collect(&:value).sum
    end

    #----------------------

    def calculate_casting
      main_parameter_bonus.to_i + character_level_bonus + bonus_from_skills("Rzucanie czarów") + special_casting_bonus
    end

    def main_parameter_bonus
      if character.is_a_cleric?
        Statistics::BONUS_OR_PENALTY_RANGES[calculate_wi]
      else
        Statistics::BONUS_OR_PENALTY_RANGES[calculate_int]
      end
    end

    def character_level_bonus
      (character.current_level.to_f / 2).floor
    end

    def bonus_from_skills(name)
      stats_modifiers.select { |sm| sm.modifies=="casting" && sm.group_name==name }.collect(&:value).sum
    end

    def special_casting_bonus
      0
    end

    #----------------------

    def calculate_break
      main_parameter_bonus.to_i + character_level_bonus + bonus_from_skills("Przełamanie") + special_break_bonus
    end

    def special_break_bonus
      trait_modifier_for_auxiliary_parameter_named("Przełamanie")
    end

    def calculate_amount_of_extra_spells
      stats_modifiers.select { |sm| sm.modifies=="casting" && sm.group_name=="Dodatkowe zaklęcia" }.collect(&:value).sum
    end

  end
end
