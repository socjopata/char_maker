# -*- encoding : utf-8 -*-
module Stats
  module Fencing
    #TODO maybe fix a mess with shattered fencing stuff (shared between two classes: statistics and character weapon) ?

    def raw_fencing_when_defending
       raw_fencing('defense')
     end

     def raw_fencing_when_attacking
       raw_fencing('attack')
     end

     def raw_fencing(stance)
       overall_fencing_bonus = stats_modifiers.select { |sm| sm.modifies=="fighting" && sm.group_name["Fechtunek postaci zwiększony będzie o"] }.collect(&:value).sum
       profession_base_parameter = character.profession[stance]
       skill_bonus =  stats_modifiers.select { |sm| sm.modifies=="fighting" && sm.group_name=="Fechtunek w #{stance=='defense' ? 'Obronie' : 'Ataku'}" }.collect(&:value).sum
       overall_fencing_bonus.to_i + profession_base_parameter.to_i + skill_bonus.to_i
     end

     def raw_shooting
       overall_shooting_bonus = stats_modifiers.select { |sm| sm.modifies=="fighting" && (sm.group_name["Umiejętności Strzeleckie"]) }.collect(&:value).sum
       profession_base_parameter = character.profession.shooting
       overall_shooting_bonus.to_i + profession_base_parameter.to_i
     end

     def ranged_defense_bonus_from_skills
       stats_modifiers.select { |sm| sm.modifies=="fighting" && sm.group_name=="Obrona Daleka" }.collect(&:value).sum
     end

     def total_ranged_defense(shield)
       result = 20 + the_above_fifteen_zr_bonus + ranged_defense_bonus_from_skills
       shield.present? ? (result + shield.total_defense_bonus(false) + shield.special_ranged_defense_parameter): result
     end

  end
end
