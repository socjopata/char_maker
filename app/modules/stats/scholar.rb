# -*- encoding : utf-8 -*-
module Stats
  module Scholar

    def calculate_mana_points
      if character.is_a_cleric?
        # polowa inteligencji + wiara + current_level * 1 + dorzut + bonusy z umiejetnosci (?)                                                                                                                                                                                                                                  Za każdym razem kiedy Inteligencja lub Wiara postaci zostanie w jakiś sposób na stałe zwiększona (lub zmniejszona); poprzez zdobycie nowego poziomu doświadczenia, pozyskanie magicznego przedmiotu, itp. Postać musi ponownie wyliczyć swą Moc.
      else
        # inteligencja + polowa wiary + current_level * 1 + dorzut + bonusy z umiejetnosci (?)
      end
    end


    #----------------------

    def calculate_casting
      main_paramter_bonus + character_level_bonus + casting_bonus_from_skills + special_casting_bonus
    end

    def main_paramter_bonus
      if character.is_a_cleric?
        Statistics::BONUS_OR_PENALTY_RANGES[calculate_wi]  #TODO remember about to_i
      else
        Statistics::BONUS_OR_PENALTY_RANGES[calculate_int]
      end
    end

    def character_level_bonus
      (character.level.to_f / 2).floor
    end
    #TODO possibly refactor with break
    def casting_bonus_from_skills

    end

    def special_casting_bonus

    end

    #----------------------

    def calculate_break
      main_paramter_bonus  + character_level_bonus + break_bonus_from_skills + special_break_bonus
    end

    def break_bonus_from_skills

    end

    def special_break_bonus

    end

  end
end