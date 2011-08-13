# -*- encoding : utf-8 -*-
module CharacterWizardHelper

def  display_curse_or_blessing(char)
  if char.character_background.traits.blank?
    "<strong>Klątwy i Dary: </strong> brak."
  elsif  char.character_background.traits.first.effect_type==Trait::TRAIT_TYPE["curse"]
    "<strong>Klątwy i Dary: </strong> #{char.character_background.traits.first.name} (klątwa) <br>
     <strong>Opis: </strong> #{char.character_background.traits.first.description} <br>"
  elsif  char.character_background.traits.first.effect_type==Trait::TRAIT_TYPE["blessing"]
    "<strong>Klątwy i Dary: </strong> #{char.character_background.traits.first.name} (dar) <br>
     <strong>Opis: </strong> #{char.character_background.traits.first.description} <br>"
  end
end

  def translate_gender(gender)
    gender=="Mężczyzna" ? "Mężczyzna" : "Kobieta" #I should prolly go with i18n  :\
  end

end
