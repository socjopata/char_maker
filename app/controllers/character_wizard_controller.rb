class CharacterWizardController < ApplicationController

  #TODO do routes
  #TODO brainsotrm this ;)

  def page_1
      if request.get?

      #do a show
    elsif request.post?
      #update and redirect

     #...update_attributes(params[:blah])
     #  redirect_to :action => :page_2 #or back to page_1 if errors
    end
  end
end
