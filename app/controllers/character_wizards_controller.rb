# -*- encoding : utf-8 -*-
class CharacterWizardsController < ApplicationController


  #TODO refactor fatty controllers, make them thin

  #TODO allow to user to change his mind ;)

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
      redirect_to second_step_character_wizard_path(:char_id => @character.id)
    end
  end

  def second_step
    if request.get?
      @character = Character.find(params[:char_id])
      #TODO flush stats modifiers from character statistics in case user gets back here from third step
      #do a show
    elsif request.post?
      @character = Character.find(params[:char_id])
      @character.lead_parameter = params[:main_skill]
      @character.statistics.push_social_class_stats_modifiers(params[:stat_choice])
      #TODO add stats modifiers from origin, in a callback
      @character.save(false)
      redirect_to third_step_character_wizard_path(:char_id => @character.id)
    end
  end

  def third_step
    if request.get?
      @character = Character.find(params[:char_id])
      #do a show
    elsif request.post?
      @character = Character.find(params[:char_id])
      if @character.statistics.update_attributes(params[:statistics])
        redirect_to fourth_step_character_wizard_path(:char_id => @character.id)
      else
        redirect_to third_step_character_wizard_path(:char_id => @character.id), :alert => "Napewno uzupełniłeś statystyki?"
      end
    end
  end

  def update_countries_select
    countries = Profession.find(params[:id]).countries unless params[:id].blank?
    render :partial => "countries", :locals => {:countries => countries}
  end

end
