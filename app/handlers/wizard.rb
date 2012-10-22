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
        @character.update_attribute(:session, @character.session.merge({:skill_free_assignment_base => skill_free_assignment_base, :default_skills_ids => default_skills_ids }))
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

  end

end