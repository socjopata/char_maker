module SkillModifierFor
  def skill_modifier_for(modifies, group_name)
    character.statistics.stats_modifiers.select { |sm| sm.modifies == modifies && sm.group_name == group_name && eval(sm.evaluated_instruction) }.collect(&:value).sum
  end
end