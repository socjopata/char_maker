# -*- encoding : utf-8 -*-
class CountrySelector
  attr_accessor :countries

  def initialize(character, profession)
    @countries = profession.countries
    @countries = [@countries.detect { |c| c.name=="Złote Królestwa" }] if @countries.present? && profession.name=="Rycerz" && character.gender=="Kobieta" #Overwrite for the special case of a women being a knight...
  end
end