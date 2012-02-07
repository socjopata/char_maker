# -*- encoding : utf-8 -*-
module CharacterWizardHelper

  def display_trait_warning_if_applicable(char)
     if Trait::CHOICE_BREAKERS.include?(char.character_background.traits.map(&:name).try(:first)) && char.character_background.traits.first.statistics_it_affects != char.lead_parameter
      "<p style='font-size: 16px; font-weight: bold'>Z racji posiadania daru: \"#{char.character_background.traits.first.try(:name)}\" musisz kolejny najwyższy rzut przyporządkować do parametru: #{Statistics::NAMES[char.character_background.traits.first.statistics_it_affects]}.</p>".html_safe
     end
  end

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
      "#{Statistics::NAMES[choice_part.modifies]} zostanie zmodyfikowana o #{bonus_orientation(choice_part.value)}#{choice_part.value}"
    elsif choice_part.modifies=="skills"
      "Postać otrzyma: #{choice_part.group_name}"
    elsif choice_part.modifies=="other"
      "Postać otrzyma: #{choice_part.group_name}"
    elsif choice_part.modifies=="fencing"
      "Postać otrzyma: biegłości w broni."
    elsif choice_part.modifies=="auxiliary"
      "Parametr #{choice_part.group_name} zostanie zmodyfikowany o #{bonus_orientation(choice_part.value)}#{choice_part.value}"
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
    value >= 0 ? "+" : "-"     #TODO Artur said, that there won't be such case when we nerf char while adding something. So... refactor and simplify?'
  end

   #TODO add humanized requirements !
  def nice_and_shiny_description(skill)
    [skill.description && skill.description.humanize, skill.way_it_works && skill.way_it_works.humanize, skill.limitations && skill.limitations.humanize].join("<br /> <br />").html_safe
  end

end



