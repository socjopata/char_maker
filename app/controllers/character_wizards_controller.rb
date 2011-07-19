class CharacterWizardsController < ApplicationController

  #TODO do routes
  #TODO brainsotrm this ;)

  def first_step
   if request.get?
      @character = Character.find(params[:char_id])

      #do a show
    elsif request.post?
      #update and redirect to step two

     #...update_attributes(params[:blah])
     #  redirect_to :action => :page_2 #or back to page_1 if errors
    end
  end



end
