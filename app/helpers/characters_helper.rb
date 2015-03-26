# -*- encoding : utf-8 -*-
module CharactersHelper
  def render_character_sheet(character_sheet)
    case character_sheet.character.profession.general_type
      when "scholar"
        render partial: 'characters/scholar'
      when "rogue"
        render partial: 'characters/rogue'
      when "soldier"
        render partial: 'characters/soldier'
    end
  end

  def display_character_sheet_name(character)
    case character.profession.general_type
      when "scholar"
        "Uczonych"
      when "rogue"
        "Łotrowska"
      when "soldier"
        "Żołnierska"
    end
  end

  def weapon_proficiency_bonus(weapon)
    if weapon.present? && weapon.weapon_proficiency_bonus == -5
      "red"
    end
  end
end