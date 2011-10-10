# -*- encoding : utf-8 -*-
class CharacterWizardsController < ApplicationController

  before_filter :user_signed_in?

  #TODO refactor fatty controllers, make them thin... thinner at least  :(
  #TODO allow to user to change his mind while navigating in a wizard...
  #TODO scope character search for current user !!!
  def first_step
    if request.get?
      @character = Character.find(params[:char_id])
      if @character.character_background.blank?
        @character_background = @character.build_character_background
        @character_background.draw_a_trait if @character.hardcore_trait_picking
        @character_background.save
      end
      if @character.statistics.blank?
        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save(false)
      end
      @professions = Profession.all
      @countries ||= Profession.find_by_name("Alchemik").countries
    elsif request.post?
      @character = Character.find(params[:char_id])
      @character.character_background.set_origin(params[:countries]) if @character.character_background.origin.blank?
      @character.pick_a_profession(params[:professions]) if @character.character_profession.blank?
      @character.character_background.set_social_class if @character.character_background.social_classes.blank?
      @character.character_background.fill_the_purse_with_gold unless @character.purse.present?
      redirect_to second_step_character_wizard_path(:char_id => @character.id)
    end
  end

  def second_step
    if request.get?
      @character = Character.find(params[:char_id])
      @character.statistics.stats_modifiers.clear #flush stats modifiers from character statistics in case user gets back here from third step

      @profession_skillset = @character.statistics.push_profession_modifiers
    elsif request.post?
      @character = Character.find(params[:char_id])
      @character.lead_parameter = params[:main_skill]
      @character.statistics.push_social_class_stats_modifiers(params[:social_stat_choices])
      @character.statistics.push_origin_stats_modifiers(params[:origin_stat_choices])
      @character.save(false)
      if @character.valid_for_step_three?
        redirect_to third_step_character_wizard_path(:char_id => @character.id)
      else
        redirect_to second_step_character_wizard_path(:char_id => @character.id), :alert => "Zdaję się, że nie dokonałeś jeszcze wszystkich wyborów wymaganych przez kreator postaci"
      end
    end
  end

  def third_step
    if request.get?
      @character = Character.find(params[:char_id])

      @character.skills.clear
      @character.statistics.skill_free_assignment_base = nil

      roll_set = @character.statistics.initial_dice_roll_set
      @lead_parameter = roll_set[0..4].max
      @stats = roll_set.tap { |a| a.delete_at(roll_set[0..4].rindex(roll_set[0..4].max)) }
      #do a show
    elsif request.post?
      @character = Character.find(params[:char_id])
      if @character.statistics.update_attributes(params[:statistics]) && @character.valid_for_step_fourth?
        @character.statistics.convert_stat_choices_to_skills
        redirect_to fourth_step_character_wizard_path(:char_id => @character.id)
      else
        redirect_to third_step_character_wizard_path(:char_id => @character.id), :alert => "Napewno dobrze uzupełniłeś statystyki?"
      end
    end
  end

  def fourth_step
    if request.get?
      @character = Character.find(params[:char_id])
      @strength, @dexterity, @endurance, @intelligence, @faith, @polish = @character.statistics.calculate_main_stats
      @basic_skills = Skill.basic

    elsif request.post?
      @character = Character.find(params[:char_id])
    end
  end

  def update_countries_select
    character = Character.find(params[:char_id])
    profession = Profession.find(params[:id])
    countries = profession.countries
    countries = [Country.find_by_name("Złote Królestwa")] if countries.present? && profession.name=="Rycerz" && character.gender=="Kobieta" #Overwrite for the special case of a women being a knight...
    render :partial => "countries", :locals => {:countries => countries}
  end

end
