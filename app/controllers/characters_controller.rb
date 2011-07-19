class CharactersController < ApplicationController

  before_filter :user_signed_in?
  before_filter :fetch_character, :except => [:index, :create, :new]

  def index
    @characters = current_user.characters.order("name").page(params[:page]).per(5)
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end


  def new
    @character = current_user.characters.build
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @character = current_user.characters.build(params[:character])
    respond_to do |format|
      if @character.save
        format.html { redirect_to(first_step_character_wizard_path(:char_id => @character.id), :notice => 'Pierwszy krok za nami...') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to(characters_url) }
    end
  end

  def print
    render :action => :print, :layout => false
  end

  private

  def fetch_character
    @character = current_user.characters.find(params[:id])
  end

end
