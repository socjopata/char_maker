# -*- encoding : utf-8 -*-

class Wizard
  include Rails.application.routes.url_helpers

  attr_accessor :character
  attr_reader :step, :render, :redirect, :params, :errors

  def initialize(character, step, params=nil)
    @character = character
    @step = step
    @params = params

    self.send(step.to_sym)
  end

  def set_template_to_render
    @render = "character_wizards/#{step}"
  end

  def profession_and_origin
    if params
      if @character.statistics.blank?
        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save(false)
      end
      @character.character_background.set_origin(params[:countries]) if @character.character_background.origin.blank?
      @character.character_background.update_attribute(:deity_id, params[:deities])
      @character.pick_a_profession(params[:professions]) if @character.character_profession.blank?
      @character.character_background.set_social_class if @character.character_background.social_classes.blank?
      @character.character_background.fill_the_purse_with_gold unless @character.purse.present?
      @redirect = character_wizard_path(:char_id => @character.id, :step => "profession_and_origin_choices")
    else
      @character.character_background.draw_a_trait if @character.hardcore_trait_picking && @character.character_background.origin.blank?
      @professions = ProfessionSelector.new(@character).results
      @profession = @professions.first
      @countries ||= Profession.find_by_name(@profession.name).countries
      @deities ||= DeitySelector.new(@character, @countries.first.id, @profession.id).deities

      set_template_to_render
    end
  end

  def profession_and_origin_choices
    if params
      @character.lead_parameter = params[:main_skill]
      @character.statistics.push_social_class_stats_modifiers(params[:social_stat_choices])
      @character.statistics.push_origin_stats_modifiers(params[:origin_stat_choices])
      @character.save(false)
      if @character.valid_for_step_three?
        @redirect = character_wizard_path(:char_id => @character.id, :step => "picking_statistics")
      else
        @redirect = character_wizard_path(:char_id => @character.id, :step => "profession_and_origin_choices")
        @errors = "Zdaję się, że nie dokonałeś jeszcze wszystkich wyborów wymaganych przez kreator postaci"
      end
    else
      @character.statistics.stats_modifiers.clear #flush stats modifiers from character statistics in case user gets back here from the next step
      @profession_skillset = @character.statistics.push_profession_modifiers

      set_template_to_render
    end
  end

  def picking_statistics
    if params
      if @character.statistics.update_attributes(params[:statistics]) && @character.valid_for_step_fourth? && @character.valid_stats_assignment?
        skill_free_assignment_base, default_skills_ids = @character.statistics.convert_stat_choices_to_skills
        @character.update_attribute(:session, @character.session.merge({:skill_free_assignment_base => skill_free_assignment_base, :default_skills_ids => default_skills_ids}))
        @redirect = character_wizard_path(:char_id => @character.id, :step => "picking_fighstyle")
      else
        @errors = "Napewno dobrze uzupełniłeś statystyki?"
        @errors << " Zwróć szczególna uwagę na swój dar: \"#{@character.character_background.traits.first.try(:name)}\" i sposób w jaki musisz przyporządkować drugi najwyższy wylosowany paramter." unless  @character.valid_stats_assignment?
        @redirect = character_wizard_path(:char_id => @character.id, :step => "picking_statistics")
      end
    else
      @character.update_attribute(:session, @character.session.merge({:skill_free_assignment_base => nil,
                                                                      :default_skills_ids => nil,
                                                                      :skills_used => nil,
                                                                      :weapon_class_preference_left => nil,
                                                                      :coins_left => nil,
                                                                     }))

      @character.skills.each { |skill| skill.substract_skill_from(@character.id) }

      roll_set = @character.statistics.initial_dice_roll_set
      @lead_parameter = roll_set[0..4].max
      @stats = roll_set.tap { |a| a.delete_at(roll_set[0..4].rindex(roll_set[0..4].max)) }

      set_template_to_render
    end
  end

  def picking_fighstyle
    if params
      if (@character.fight_style.present? and @character.update_attributes(:wield_style_id => params[:wield_style_id])) || @character.update_attributes(:fight_style_id => params[:fight_style_id], :wield_style_id => params[:wield_style_id])
        @redirect = character_wizard_path(:char_id => @character.id, :step => "skills_picking")
      else
        @error = "Czy aby napewno zależności Siła/Zręczność a wybrany styl walki, są spełnione?"
        @redirect = character_wizard_path(:char_id => @character.id, :step => "picking_fighstyle")
      end
    else
      @character.make_rogue_a_finesse_fighter
      @strength, @dexterity, @endurance, @intelligence, @faith, @polish = @character.statistics.calculate_main_stats
      set_template_to_render
    end
  end

  def skills_picking
    if params
      @character.update_attribute(:session, @character.session.merge({:coins_left =>  @character.purse.update_current}))    if @character.purse.current.blank?
      @character.update_attribute(:session, @character.session.merge({:weapon_class_preference_left => @character.statistics.calculate_weapon_class_proficiencies_points}))
      @redirect = character_wizard_path(:char_id => @character.id, :step => "clarify_skill_choices")
    else
      @strength, @dexterity, @endurance, @intelligence, @faith, @polish = @character.statistics.calculate_main_stats
      @basic_skills = Skill.basic
      @caste_skills = Skill.fetch_caste_skills_for(@character)
      @profession_skills = Skill.fetch_profession_skills_for(@character)
      @cannot_select_skills = Skill.filter_nonselectable((@basic_skills + @caste_skills + @profession_skills), @character, @strength, @dexterity, @endurance, @intelligence, @faith, @polish)
      @free_skill_amount = Skill.calculate_free_skill_amount(@character, @character.session[:skill_free_assignment_base], Statistics::BONUS_OR_PENALTY_RANGES[@intelligence].to_i, @character.session[:skills_used].to_i)
      set_template_to_render
    end
  end

  def clarify_skill_choices
    if params
      if @character.valid_for_armament_step?
        @redirect = character_wizard_path(:char_id => @character, :step => "armament_picking")
      else
        flash_alert = ""
        flash_alert << "Musisz sprecyzować bonusy wynikające z umiejętności." if @character.any_unfinished_matters_present?
        flash_alert << " Jako strzelec, musisz być biegły przynajmniej w jednej grupie broni dystansowej." if @character.is_a_shooter_and_didnt_picked_his_bow
        @errors = flash_alert
        @redirect = character_wizard_path(:char_id => @character, :step => "clarify_skill_choices")
      end
    else
      @weapon_groups = WeaponGroupProficiencySelector.new(@character).weapon_groups
      set_template_to_render
    end
  end

  def armament_picking

  end

end
