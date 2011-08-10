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
      @countries = []
    elsif request.post?

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
