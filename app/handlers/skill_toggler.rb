class SkillToggler

  attr_reader :character, :value, :skill_free_assignment_base
  attr_accessor :skills_used, :red_flag

  def initialize(current_user, char_id, skills_used, skill_id, value, skill_free_assignment_base)
    @character = current_user.characters.find(char_id)
    @skills_used = skills_used
    @red_flag = nil
    @value = value
    @skill_free_assignment_base = skill_free_assignment_base
    @skill = Skill.find(skill_id)
  end

  def process!
    if user_is_adding_new_skill?
      if user_allowed_to_pick_another_skill?
        @skills_used += 1
        commands, skill_commands = Skill.change(@character, @skill, @value)
      else
        @red_flag = true
        commands, skill_commands = nil
      end
    else
      @skills_used -= 1
      commands, skill_commands = Skill.change(@character, @skill, @value)
    end

    [commands, skill_commands, @red_flag, free_skill_amount, @skills_used]
  end

  def user_allowed_to_pick_another_skill?
    return false if free_skill_amount < 1
    true
  end

  def user_is_adding_new_skill?
    @value
  end

  def free_skill_amount
    Skill.calculate_free_skill_amount(@character, @skill_free_assignment_base, Statistics::BONUS_OR_PENALTY_RANGES[@character.statistics.calculate_int].to_i, @skills_used.to_i)
  end

end
