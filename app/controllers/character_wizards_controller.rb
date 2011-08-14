# -*- encoding : utf-8 -*-
class CharacterWizardsController < ApplicationController


  #TODO refactor fatty controllers, make them thin

  def first_step
    if request.get?
      @character = Character.find(params[:char_id])
      if @character.character_background.blank?
        @character_background = @character.build_character_background
        @character_background.draw_a_trait if @character.hardcore_trait_picking
        @character_background.save
      end
      @professions = Profession.all
      @countries ||= Profession.find_by_name("Alchemik").countries
      #TODO fix double popualte error
    elsif request.post?
      @character = Character.find(params[:char_id])
      #TODO finish this
      @character.character_background.set_origin(params[:countries]) if @character.character_background.origin.blank?
      @character.pick_a_profession(params[:professions]) if @character.character_profession.blank?
      @character.character_background.set_social_class        #TODO unless social class exists
      redirect_to second_step_character_wizard_path(:char_id => @character.id)
    end
  end

  def second_step
    if request.get?
      @character = Character.find(params[:char_id])
      if @character.statistics.blank?
        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save(false)
      end
      #do a show
    elsif request.post?
      @character = Character.find(params[:char_id])
      if @character.statistics.update_attributes(params[:statistics])
        redirect_to third_step_character_wizard_path(:char_id => @character.id)
      else
        redirect_to second_step_character_wizard_path(:char_id => @character.id), :alert => "Napewno uzupełniłeś statystyki?"
      end
    end
  end

  def third_step

  end

  def update_countries_select
    countries = Profession.find(params[:id]).countries unless params[:id].blank?
    render :partial => "countries", :locals => {:countries => countries}
  end

end
