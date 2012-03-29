# -*- encoding : utf-8 -*-
class CountrySelector
  attr_accessor :countries

  def initialize(current_user, char_id, profession_id)
    character = current_user.characters.find(char_id)
    profession = Profession.find(profession_id)
    @countries = profession.countries
    @countries = [@countries.detect{|c| c.name=="Złote Królestwa"}] if @countries.present? && profession.name=="Rycerz" && character.gender=="Kobieta" #Overwrite for the special case of a women being a knight...
  end


end

