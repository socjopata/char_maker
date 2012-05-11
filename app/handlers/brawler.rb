class Brawler

  attr_reader :hit_parameter, :dodge_parameter, :special_rules_bonus, :skill_bonus

  def initialize(character)
    @character = character
  end

end