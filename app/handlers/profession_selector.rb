# -*- encoding : utf-8 -*-
class ProfessionSelector

  attr_accessor :results

  def initialize(character)
    character.character_background.deity.name == "Brak/Ateizm" ? @results =  Profession.all.reject{|p| p.name=="Kapłan"} :  @results = Profession.all
  end

end