class Commander

  def initialize(character, skill)
    @skill = skill
    @character = character
  end

  def do!
    instructions = []
    @skill.stats_choices.collect(&:stats_modifiers).flatten.each do |modifier|
      instructions << interpret(modifier)
    end
    instructions.flatten
  end

  #TODO finish coding this
  def interpret(modifier)
    result = []

    if ["S", "ZR", "WT", "INT", "WI", "O"].include?(modifier.modifies)
      result << [Hash["main_table_value_#{Statistics::ENGLISH_NAMES[modifier.modifies]}", @character.statistics.send("calculate_#{modifier.modifies.downcase}".intern)], Hash["main_table_bonus_#{Statistics::ENGLISH_NAMES[modifier.modifies]}", @character.statistics.calculate_main_skill_bonus_for(modifier.modifies)]]
      case modifier.modifies
        when "S"
          #nothing actually
        when "ZR"
          #initiative and running and sprinting
          result << [
              Hash["auxiliary_table_total_initiative", @character.statistics.calculate_initiative],
              Hash["auxiliary_table_main_p_bonus_for_initiative", Statistics::BONUS_OR_PENALTY_RANGES[@character.statistics.calculate_zr]],
              Hash["auxiliary_table_total_running", @character.statistics.calculate_running],
              Hash["auxiliary_table_main_p_bonus_for_running", Statistics::BONUS_OR_PENALTY_RANGES[@character.statistics.calculate_zr]],
              Hash["auxiliary_table_total_sprinting", @character.statistics.calculate_sprinting]
          ]
        when "WT"
          result << [
              Hash["auxiliary_table_total_pain_resistance", @character.statistics.calculate_pain_resistance],
              Hash["auxiliary_table_main_p_bonus_for_pain_resistance", Statistics::BONUS_OR_PENALTY_RANGES[@character.statistics.calculate_wt]],
              Hash["auxiliary_table_total_life_points", @character.statistics.calculate_life_points],
              Hash["auxiliary_table_main_p_bonus_for_life_points", @character.statistics.calculate_wt]
          ]
        when "INT"
          #nothing actually
        when "O"
          #nothing actually
        when "WI"
          result << [
              Hash["auxiliary_table_total_fear_resistance", @character.statistics.calculate_fear_resistance],
              Hash["auxiliary_table_main_p_bonus_for_fear_resistance", Statistics::BONUS_OR_PENALTY_RANGES[@character.statistics.calculate_wi]]
          ]
      end
    elsif modifier.modifies=="auxiliary"
      result << [Hash["auxiliary_table_total_#{AuxiliaryParameterSet::ENGLISH_NAMES[modifier.group_name]}", @character.statistics.send("calculate_#{AuxiliaryParameterSet::ENGLISH_NAMES[modifier.group_name]}".intern)],
                 Hash["auxiliary_table_skill_bonus_for_#{AuxiliaryParameterSet::ENGLISH_NAMES[modifier.group_name]}", @character.statistics.calculate_auxiliary_bonus(modifier.group_name, "only_from_skills")]
      ]
    end
    result.flatten
  end


  #TODO and skills table...

end

#TODO instructions can double - scenario: skill modifies dexterity and initiative. There will be two instruction to modify total field.
