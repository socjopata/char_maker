class Commander

  def initialize(character, skill)
   @skill = skill.clone
   @character = character.clone
  end

  def do!
    instructions = []
      @skill.stats_choices.collect(&:stats_modifiers).flatten.each do |modifier|
      instructions <<  Commander.interpret(modifier) #.flatten here?
      end

  end

  #TODO finish coding this
  def self.interpret(modifier)
       if ["S", "ZR", "WT", "INT", "WI", "O"].include?(modifier.modifies)
         [Hash["main_table_value_#{Statistics::ENGLISH_NAMES[modifier.modifies]}",  @character.statistics.send("calculate_#{modifier.modifies.downcase}".intern)], Hash["main_table_bonus_#{Statistics::ENGLISH_NAMES[modifier.modifies]}", @character.statistics.calculate_main_skill_bonus_for(modifier.modifies)]]
       elsif modifies=="auxiliary"
          [ Hash["auxiliary_table_total_#{AuxiliaryParameterSet::ENGLISH_NAMES[modifier.group_name]}",  1]
          ]
       else
         throw "Please code this case !"
       end

  end



end