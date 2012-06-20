# -*- encoding : utf-8 -*-
class ProfessionSelector

  attr_accessor :results

  def initialize(character)
     @results = Profession.all
  end

end
