class CharactersController < ApplicationController

  before_filter :user_signed_in?
  before_filter :fetch_character, :except => [:index, :create, :new]

  def index
    @characters = Character.belongs_to_user(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characters }
    end
  end


  def show


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @character }
    end
  end


  def new
    @character = current_user.characters.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @character }
    end
  end


  def edit

  end


  def create
    @character = current_user.characters.build(params[:character])

    respond_to do |format|
      if @character.save
        format.html { redirect_to(@character, :notice => 'Character was successfully created.') }
        format.xml  { render :xml => @character, :status => :created, :location => @character }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update


    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to(@character, :notice => 'Character was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy

    @character.destroy

    respond_to do |format|
      format.html { redirect_to(characters_url) }
      format.xml  { head :ok }
    end
  end

  private

  def fetch_character

    @character = current_user.characters.find(params[:id])
  end

end
