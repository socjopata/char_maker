# -*- encoding : utf-8 -*-
module CharacterWizardHelper

  def display_curse_or_blessing(char)
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

  def display_choice_part(choice_part)

    if ["S", "ZR", "WT", "INT", "WI", "O"].include?(choice_part.modifies)
      "#{Statistics::NAMES[choice_part.modifies]} zostanie zmodyfikowana o #{choice_part.value}"
    elsif choice_part.modifies=="skills"
      "Postać otrzyma: #{choice_part.group_name}"
    elsif choice_part.modifies=="other"
      "Postać otrzyma: #{choice_part.group_name}"
    elsif choice_part.modifies=="fencing"
      "Postać otrzyma: biegłości w broni."
    elsif choice_part.modifies=="magic resistance"
      "Postać otrzyma: #{choice_part.value} pkt odporności na magię"
    elsif choice_part.modifies=="auxiliary"
      "Paramter #{choice_part.group_name} zostanie zmodyfikowany o #{choice_part.value}"
    else
      "nie zdefiniowano #TODO"
    end
  end

  def fetch_possible_lead_parameters_choices(char_profession)
    char_profession.profession.lead_parameters
  end

  def humanize_purse_content(cooper)
    values = sprintf('%0.2f', (cooper.to_f / 100)).split '.'
    gold = values[0]
    silver = values[1][0]
    cooper = values[1][1]
    "#{gold} złota, #{silver} srebra i #{cooper} miedzi"
  end

  def display_default_for_profession_and_origin(stats_choice)
    stats_choice.stats_modifiers.collect do |choice_part|
      content_tag("li", display_choice_part(choice_part))
    end.join(" ")
  end

  def choices_for_profession_and_origin(character)
    stats_choices = character.character_background.origin.country.stats_choices.find_all_by_applies_to("special")
  end

  def applies?(social_class, stats_choice)
    social_class.send(stats_choice.condition.intern)
  end

  def one_free_skill
    StatsModifier.find_by_name("Jedna wolna umiejętność")
  end

  def bonus_orientation(value)
    value >= 0 ? "+" : "-"
  end

end



