# -*- encoding : utf-8 -*-

class DeitySelector

  ATHEISM_FORBIDDEN_PROFESSIONS = ["Kapłan", "Rycerz Zakonny", "Szaman"]

  attr_accessor :deities

  def initialize(character, country_id, profession_id)
    country = Country.find(country_id)
    profession = Profession.find(profession_id)
    @deities = prepare_deities_list(character, country, profession)
  end


  def prepare_deities_list(character, country, profession)
    if ATHEISM_FORBIDDEN_PROFESSIONS.include?(profession.name)
      #TODO
    elsif character.easy_deity_picking
      country.deities
    elsif !character.easy_deity_picking
      Deity.all
    end
  end

end