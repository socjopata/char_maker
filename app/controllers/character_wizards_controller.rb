class CharacterWizardsController < ApplicationController

  #TODO do routes
  #TODO brainsotrm this ;)

  def first_step
    if request.get?
      @character = Character.find(params[:char_id])
      if @character.character_background.blank?
        @character_background = @character.build_character_background
        @character_background.draw_a_trait
        @character_background.save

        @stats = @character.build_statistics
        @stats.draw_stats
        @stats.save
      end
      # @character_background = CharacterBackground.new
      #do a show
    elsif request.post?

      #update and redirect to step two

      #...update_attributes(params[:blah])
      redirect_to second_step_character_wizard_path(:char_id => @character.id), :notice => 'Teraz widzisz drugi krok?' #or back to page_1 if errors
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
