# -*- encoding : utf-8 -*-
module Stats
  module Auxiliary
    def calculate_initiative
       AuxiliaryParameterSet::INITIATIVE_MAP[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_zr].to_i + calculate_auxiliary_bonus("Inicjatywa")
     end

     def calculate_perception
       AuxiliaryParameterSet::PERCEPTION_MAP[character.profession.general_type] + character.current_level + calculate_auxiliary_bonus("Spostrzegawczość")
     end

     def calculate_pain_resistance
       AuxiliaryParameterSet::PAIN_RESISTANCE_MAP[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_wt].to_i + calculate_auxiliary_bonus("Odporność na Ból")
     end

     def calculate_fear_resistance
       AuxiliaryParameterSet::FEAR_RESISTANCE_MAP[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_wi].to_i + calculate_auxiliary_bonus("Odporność na Strach")
     end

     def calculate_magic_resistance
       AuxiliaryParameterSet::MAGIC_RESISTANCE_MAP[character.profession.general_type] + calculate_auxiliary_bonus("Odporność na Magię") + magic_resistance_shield_bonus_for(character) #TODO Refactor this, if there is more of item stats modifiers cases
     end

     def calculate_life_points
       AuxiliaryParameterSet::HIT_POINTS_MAP[character.profession.general_type] + calculate_wt + calculate_auxiliary_bonus("Punkty Życia")
     end

     def calculate_running
       AuxiliaryParameterSet::RUNNING_MAP[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_current_zr].to_i + calculate_auxiliary_bonus("Bieg")
     end

     def calculate_sprinting
       AuxiliaryParameterSet::RUNNING_MAP[character.profession.general_type] + Statistics::BONUS_OR_PENALTY_RANGES[calculate_current_zr].to_i + 10 + calculate_auxiliary_bonus("Bieg")
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


    def magic_resistance_shield_bonus_for(character)
      fav_shield = character.character_shields.where(:favorite => true).first
      if fav_shield and stats_choice = fav_shield.resource.stats_choices.first
        stats_choice.stats_modifiers.where(:group_name => "Odporność na Magię").first.try(:value).to_i
      else
        0
      end
    end

  end
end
