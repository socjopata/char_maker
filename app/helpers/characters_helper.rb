# -*- encoding : utf-8 -*-
module CharactersHelper

  def render_character_sheet(character)
    case character.profession.general_type
      when "scholar" then
        render :partial => 'characters/character_sheets/scholar' #, :locals => locals
      when "rogue" then
        render :partial => 'characters/character_sheets/rogue' #, :locals => locals
      when "soldier" then
        render :partial => 'characters/character_sheets/soldier' #, :locals => locals
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
end


