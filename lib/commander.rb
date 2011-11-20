class Commander

  def initialize(character, skill, skills=[])
    @skill = skill
    @character = character
    @nonselectables = skills
  end

  def do!
    instructions = []
    @skill.stats_choices.collect(&:stats_modifiers).flatten.each do |modifier|
      instructions << interpret(modifier)
    end
    skill_instructions = []
    skill_instructions = translate(@nonselectables, Skill.filter_nonselectable(Skill.basic, @character, @character.statistics.calculate_s, @character.statistics.calculate_zr, @character.statistics.calculate_wt, @character.statistics.calculate_int, @character.statistics.calculate_wi, @character.statistics.calculate_o)) if @nonselectables.present?
    [instructions.uniq.flatten, skill_instructions]
  end

  def translate(before, after)
    skill_instructions = []
    new_skills_available_to_pick = before - after
    skills_to_disable =   after - before
    if new_skills_available_to_pick.present?
     skill_instructions << new_skills_available_to_pick.collect {|skill|  Hash[skill["id"], "enable"]}
    elsif skills_to_disable.present?
     skill_instructions << skills_to_disable.collect {|skill|  Hash[skill["id"], "disable"]}
    end
   skill_instructions.flatten
  end

  #for modifiers
  def interpret(modifier)
    result = []
    if ["S", "ZR", "WT", "INT", "WI", "O"].include?(modifier.modifies)
      base_skill_value = @character.statistics.send("calculate_#{modifier.modifies.downcase}".intern)
      result << [
          Hash["main_table_value_#{Statistics::ENGLISH_NAMES[modifier.modifies]}", base_skill_value],
          Hash["main_table_bonus_#{Statistics::ENGLISH_NAMES[modifier.modifies]}", Statistics::BONUS_OR_PENALTY_RANGES[base_skill_value]]
      ]
      case modifier.modifies
        when "S"
          #nothing actually
        when "ZR"
          #initiative and running and sprinting
          result << [
              Hash["auxiliary_table_total_initiative", @character.statistics.calculate_initiative],
              Hash["auxiliary_table_main_p_bonus_for_initiative", Statistics::BONUS_OR_PENALTY_RANGES[base_skill_value]],
              Hash["auxiliary_table_total_running", @character.statistics.calculate_running],
              Hash["auxiliary_table_main_p_bonus_for_running", Statistics::BONUS_OR_PENALTY_RANGES[base_skill_value]],
              Hash["auxiliary_table_total_sprinting", @character.statistics.calculate_sprinting]
          ]
        when "WT"
          result << [
              Hash["auxiliary_table_total_pain_resistance", @character.statistics.calculate_pain_resistance],
              Hash["auxiliary_table_main_p_bonus_for_pain_resistance", Statistics::BONUS_OR_PENALTY_RANGES[base_skill_value]],
              Hash["auxiliary_table_total_life_points", @character.statistics.calculate_life_points],
              Hash["auxiliary_table_main_p_bonus_for_life_points", base_skill_value]
          ]
        when "INT"
          #nothing actually
        when "O"
          #nothing actually
        when "WI"
          result << [
              Hash["auxiliary_table_total_fear_resistance", @character.statistics.calculate_fear_resistance],
              Hash["auxiliary_table_main_p_bonus_for_fear_resistance", Statistics::BONUS_OR_PENALTY_RANGES[base_skill_value]]
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
  #TODO filter instructions for actual change ?
end
