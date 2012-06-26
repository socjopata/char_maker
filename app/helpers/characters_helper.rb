# -*- encoding : utf-8 -*-
module CharactersHelper

  def render_character_sheet(character)
    case character.profession.general_type
      when "scholar" then
        render :partial => 'characters/scholar' #, :locals => locals
      when "rogue" then
        render :partial => 'characters/rogue' #, :locals => locals
      when "soldier" then
        render :partial => 'characters/soldier' #, :locals => locals
    end
  end

  def display_character_sheet_name(character)
    case character.profession.general_type
      when "scholar" then
        "Uczonych"
      when "rogue" then
        "Łotrowska"
      when "soldier" then
        "Żołnierska"
    end
  end

  def weapon_proficiency_bonus(weapon)
    if weapon.present? && weapon.weapon_proficiency_bonus==-5
      "red"
    end
  end
end


