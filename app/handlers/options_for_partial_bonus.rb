class OptionsForPartialBonus

  attr_accessor :results

  def initialize(sm)
   @results = sm.group_name[/\(.*\)/][1..-2].split(",")
  end

end