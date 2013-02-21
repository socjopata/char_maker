# -*- encoding : utf-8 -*-
module CharacterWizardHelper

  def display_trait_warning_if_applicable(char)
    if Trait::CHOICE_BREAKERS.include?(char.character_background.traits.map(&:name).try(:first)) && char.character_background.traits.first.statistics_it_affects != char.lead_parameter
      "<p style='font-size: 16px; font-weight: bold'>Z racji posiadania daru: \"#{char.character_background.traits.first.try(:name)}\" musisz kolejny najwyższy rzut przyporządkować do parametru: #{Statistics::POLISH_NAMES[char.character_background.traits.first.statistics_it_affects]}.</p>".html_safe
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
      "#{Statistics::POLISH_NAMES[choice_part.modifies]} zostanie zmodyfikowana o #{bonus_orientation(choice_part.value)}#{choice_part.value}"
    elsif choice_part.modifies=="skills"
      "Postać otrzyma: #{choice_part.group_name}"
    elsif choice_part.modifies=="other"
      "Postać otrzyma: #{choice_part.group_name}"
    elsif choice_part.modifies=="fighting"
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
    gold, silver, cooper = purse_content(cooper)
    "#{gold} złota, #{silver} srebra i #{cooper} miedzi"
  end

  def purse_content(cooper)
    values = sprintf('%0.2f', (cooper.to_f / 100)).split '.'
    gold = values[0]
    silver = values[1][0]
    cooper = values[1][1]
    [gold, silver, cooper]
  end


  def display_default_for_profession_and_origin(stats_choice)
    stats_choice.stats_modifiers.collect do |choice_part|
      display_choice_part(choice_part)
    end.join("<br/>")
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
    value >= 0 ? "+" : ""
  end

  def parameter_with_bonus_orientation(value)
    value >= 0 ? "+#{value}" : "#{value}"
  end

  def nice_and_shiny_description(skill)
    description_base = [skill.description && skill.description.humanize, skill.way_it_works && skill.way_it_works.humanize, skill.limitations && skill.limitations.humanize].join("<br /> <br />")
    requirements = skill.skill_requirements.map(&:make_human_readable).join("<br />")
    (description_base + (requirements.present? ? ("<br /> <br /><strong>Wymagania: </strong><br /> <br />" + requirements) : "" )).html_safe
  end

  def present_choice_subject(sm)
    case sm.group_name
      when "Fechtunek w Grupie Broni"
        weapon_group_choice_for(sm)
      when /Wybrana broń/
        weapon_choice_for(sm)
      when /Wybrana tarcza/
        shield_choice_for(sm)
      when /Wybrana grupa broni/
        partial_bonus_for_weapon_group(sm)
      else
        throw "You forgot to implement it dumbass!"
    end
  end

  def weapon_group_choice_for(sm)
    ("<label>#{sm.grand_daddy.name} </label>" + select_tag("choice", options_for_select(@weapon_groups))).html_safe
  end

  def weapon_choice_for(sm)
    ("<label>#{sm.grand_daddy.name} </label>" + select_tag("choice", options_for_select(Weapon.all.map(&:name))+RangedWeapon.all.map(&:name))).html_safe
  end

  def shield_choice_for(sm)
    ("<label>#{sm.grand_daddy.name} </label>" + select_tag("choice", options_for_select(Shield.all.map(&:name)))).html_safe
  end

  def partial_bonus_for_weapon_group(sm)
    ("<label>#{sm.grand_daddy.name} </label>" + select_tag("choice", options_for_select(OptionsForPartialBonus.new(sm).results))).html_safe
  end

  def item_upgrade_link(character, item, connecting_object, improvement_type)
    if connecting_object.send(improvement_type.intern).present?
      link_to("Usuń ulepszenie",
              revert_improvement_character_wizard_path(:char_id => character.id,
                                                       :item_type => item.class.name,
                                                       :inventory_item => item.id,
                                                       :improvement_id => connecting_object.id,
                                                       :improvement_type => improvement_type),
              :remote => true).html_safe
    else
      link_to("Ulepsz",
              improve_item_character_wizard_path(:char_id => character.id,
                                                 :item_type => item.class.name,
                                                 :inventory_item => item.id,
                                                 :improvement_id => connecting_object.id,
                                                 :improvement_type => improvement_type),
              :remote => true).html_safe
    end
  end

  def ranged_weapon_speed_upgrade_link(character, item, connecting_object, improvement_type)
    if item.is_a_bow?
      item_upgrade_link(character, item, connecting_object, improvement_type)
    else
      "Nie można ulepszyć."
    end
  end

  def set_shield_as_main(character, connecting_object)
    if connecting_object.favorite?
      "Tarcza główna"
    else
      link_to("Ustaw jako główną",
              set_shield_as_main_character_wizard_path(:char_id => character.id,
                                                       :inventory_item => connecting_object.id),
              :remote => true).html_safe
    end
  end

  def set_armor_as_main(character, connecting_object)
    if connecting_object.favorite?
      "Zbroja główna"
    else
      link_to("Oznacz jako aktualnie używaną",
              set_armor_as_main_character_wizard_path(:char_id => character.id,
                                                      :inventory_item => connecting_object.id),
              :remote => true).html_safe
    end
  end

  def statistics_picking_trs(wizard)
    Statistics::ENGLISH_NAMES.map do |key, value|
      content_tag(:div, content_tag(:div, (wizard.instance_variable_get("@lead_parameter") if wizard.character.lead_parameter==key), :id => value, :class => "drop #{"lead" if wizard.character.lead_parameter==key}"), :class => "span1")
    end.join.html_safe
  end

  def social_class_perks(wizard)
    elements = "".html_safe
    wizard.character.social_class_stats_choices.each do |choice|
      if choice.stats_modifiers.size == 1
        elements << render(:partial => 'single', :locals => {:stats_modifier => choice.stats_modifiers.first, :radio_group => "social_stat_choices[#{choice.id}]"})
      else
        elements << render(:partial => 'choices', :locals => {:stats => choice.stats_modifiers.to_set.classify { |stat| stat.group_name.humanize }, :radio_group => "social_stat_choices[#{choice.id}]"})
      end
    end
    elements
  end

  def profession_and_origin_perks(wizard)
    elements = "".html_safe
    choices_for_profession_and_origin(wizard.character).each do |choice|
      if applies?(wizard.character.social_class, choice)
        _choice = choice.stats_modifiers.map(&:group_name) - wizard.instance_variable_get("@profession_skillset")
        if _choice.blank?
          elements << render(:partial => 'single', :locals => {:stats_modifier => StatsModifier.default, :radio_group => "origin_stat_choices[#{choice.id}]"})
        elsif _choice.size == 1
          elements << render(:partial => 'single', :locals => {:stats_modifier => choice.stats_modifiers.select { |sm| sm.group_name==_choice.first }.first, :radio_group => "origin_stat_choices[#{choice.id}]"})
        elsif _choice.size > 1
          elements << render(:partial => 'choices', :locals => {:stats => choice.stats_modifiers.to_set.classify { |stat| stat.group_name.humanize }, :radio_group => "origin_stat_choices[#{choice.id}]"})
        end
      end
    end
    elements
  end


end



