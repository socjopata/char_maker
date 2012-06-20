# -*- encoding : utf-8 -*-
module Stats
  module Auxiliary
    def calculate_initiative
       AuxiliaryParameterSet::INITIATIVE[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_zr].to_i + calculate_auxiliary_bonus("Inicjatywa")
     end

     def calculate_perception
       AuxiliaryParameterSet::PERCEPTION[character.profession.general_type] + character.current_level + calculate_auxiliary_bonus("Spostrzegawczość")
     end

     def calculate_pain_resistance
       AuxiliaryParameterSet::PAIN_RESISTANCE[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_wt].to_i + calculate_auxiliary_bonus("Odporność na Ból")
     end

     def calculate_fear_resistance
       AuxiliaryParameterSet::FEAR_RESISTANCE[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_wi].to_i + calculate_auxiliary_bonus("Odporność na Strach")
     end

     def calculate_magic_resistance
       AuxiliaryParameterSet::MAGIC_RESISTANCE[character.profession.general_type] + calculate_auxiliary_bonus("Odporność na Magię")
     end

     def calculate_life_points
       AuxiliaryParameterSet::HIT_POINTS[character.profession.general_type] + character.statistics.calculate_wt + calculate_auxiliary_bonus("Punkty Życia")
     end

     def calculate_running
       AuxiliaryParameterSet::RUNNING[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_current_zr].to_i + calculate_auxiliary_bonus("Bieg")
     end

     def calculate_sprinting
       AuxiliaryParameterSet::RUNNING[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_current_zr].to_i + 10 + calculate_auxiliary_bonus("Bieg")
     end

     def calculate_auxiliary_bonus(name, total="yep, I want total")
       case total
         when "yep, I want total"
           stats_modifiers.select { |sm| sm.modifies=="auxiliary" && sm.group_name==name }.collect(&:value).sum + trait_modifier_for_auxiliary_parameter_named(name) + calculate_variable_auxiliary_bonus(name)
         when "only_from_skills"
           stats_modifiers.select { |sm| sm.grand_daddy.is_a?(Skill) && sm.modifies=="auxiliary" && sm.group_name==name }.collect(&:value).sum + calculate_variable_auxiliary_bonus(name)
         when "only_special"
           stats_modifiers.select { |sm| !sm.grand_daddy.is_a?(Skill) && sm.modifies=="auxiliary" && sm.group_name==name }.collect(&:value).sum + trait_modifier_for_auxiliary_parameter_named(name)
       end
     end

     def calculate_variable_auxiliary_bonus(name)
       values = stats_modifiers.select { |sm| sm.modifies=="variable_auxiliary" && sm.group_name==name }.map { |sm| eval(sm.evaluated_instruction).to_i }
       values.present? ? values.sum : 0
     end

  end
end
