# -*- encoding : utf-8 -*-
class DeitySelector
  ATHEISM_FORBIDDEN_PROFESSIONS = ["Kapłan", "Rycerz Zakonny", "Szaman"]
  CLERIC_DEITIES = ["Sirtol", "Kastor", "Smoczy Bóg", "Kalastra", "Syrion", "Alaj", "Calisto", "Durgil",]
  WARRIOR_CLERIC_DEITIES = ["Alaj", "Durgil", "Fortuna", "Kastor", "Smoczy Bóg", "Sirtol", "Syrion"]
  SHAMAN_DEITIES = ["Magni", "Kal-Kalar", "Galos i Malos", "Calisto"]

  attr_accessor :deities, :country

  def initialize(character, country_id, profession_id)
    @country = Country.find(country_id)
    profession = Profession.find(profession_id)
    @deities = prepare_deities_list(character, country, profession)
  end


  def prepare_deities_list(character, country, profession)
    if ATHEISM_FORBIDDEN_PROFESSIONS.include?(profession.name)
      return cleric_deities(character.easy_deity_picking, country) if profession.name=="Kapłan"
      return warrior_cleric_deities(character.easy_deity_picking, country) if profession.name=="Rycerz Zakonny"
      return shaman_deities(character.easy_deity_picking, country) if profession.name=="Szaman"
    elsif character.easy_deity_picking
      country.deities
    elsif !character.easy_deity_picking
      Deity.all
    end
  end

  def cleric_deities(easy_deity_picking, country)
    if easy_deity_picking
      country.deities & Deity.find_all_by_name(CLERIC_DEITIES)
    else
      [Deity.find_all_by_name(CLERIC_DEITIES)]
    end
  end

  def warrior_cleric_deities(easy_deity_picking, country)
    if easy_deity_picking
      country.deities & Deity.find_all_by_name(WARRIOR_CLERIC_DEITIES)
    else
      [Deity.find_all_by_name(WARRIOR_CLERIC_DEITIES)]
    end
  end

  def shaman_deities(easy_deity_picking, country)
    if easy_deity_picking
      country.deities & Deity.find_all_by_name(SHAMAN_DEITIES)
    else
      [Deity.find_all_by_name(SHAMAN_DEITIES)]
    end
  end
end