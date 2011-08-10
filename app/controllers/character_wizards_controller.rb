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
      if @character.statistics.blank?
        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save(false)
      end
      # @character_background = CharacterBackground.new
      #do a show
    elsif request.post?
      @character = Character.find(params[:char_id])
      if @character.statistics.update_attributes(params[:statistics])
        redirect_to second_step_character_wizard_path(:char_id => @character.id)
      else
        redirect_to first_step_character_wizard_path(:char_id => @character.id), :alert => "Napewno uzupełniłeś statystyki?"
      end
    end
  end

  def second_step
    if request.get?

      #do a show
    elsif request.post?
      #redirect to step 3
    end
  end


end
