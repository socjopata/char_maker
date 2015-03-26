# -*- encoding : utf-8 -*-
class SkillToggler
  attr_reader :character, :value, :skill_free_assignment_base, :skill, :free_skill_amount
  attr_accessor :skills_used, :not_enough_free_skill_points, :commands, :skill_commands

  def initialize(character, skill_id, value)
    @character = character
    @skills_used = character.session[:skills_used].to_i
    @not_enough_free_skill_points = nil
    @value = value
    @skill_free_assignment_base = character.session[:skill_free_assignment_base]
    @skill = Skill.find(skill_id)
    process!
  end

  def process!
    if user_is_adding_new_skill?
      if user_allowed_to_pick_another_skill?
        character.update_attribute(:session, character.session.merge(skills_used: (skills_used + 1)))
        @commands, @skill_commands = Skill.change(character, skill, value)
      else
        @not_enough_free_skill_points = true
        @commands, @skill_commands = nil
      end
    else
      character.update_attribute(:session, character.session.merge(skills_used: (skills_used - 1)))
      @commands, @skill_commands = Skill.change(character, skill, value)
    end

    @free_skill_amount = free_skill_amount
  end

  def user_allowed_to_pick_another_skill?
    return false if free_skill_amount < 1
    true
  end

  def user_is_adding_new_skill?
    @value
  end

  def free_skill_amount
    Skill.calculate_free_skill_amount(character, skill_free_assignment_base, Statistics::BONUS_OR_PENALTY_RANGES_MAP[character.statistics.calculate_int].to_i, character.session[:skills_used].to_i)
  end
end