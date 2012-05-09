# -*- encoding : utf-8 -*-
class CharactersController < ApplicationController

  before_filter :user_signed_in?
  before_filter :fetch_character, :except => [:index, :create, :new]

  def index
    @characters = current_user.characters.where(:finished => true).order("name")
    respond_to do |format|
      format.html # index.html.erb
    end
  end


  def show
    @all_skills = @character.skills
    @extra_skills = Skill.fetch_profession_skills_for(@character).select{|skill| @all_skills.include? skill }
    @skill_names = @all_skills.map(&:name)

    @weapons = @character.character_weapons
    @shields = @character.character_shields
    render :layout => 'office'
  end

  def edit
  end

  def new
    session[:skill_free_assignment_base] = nil
    session[:default_skills_ids] = nil
    session[:skills_used] = nil
    params[:char_id].present? ? @character = current_user.characters.find(params[:char_id]) : @character = current_user.characters.build
    @character_background = @character.create_character_background
    @deities = Deity.all
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @character = current_user.characters.build(params[:character])
    respond_to do |format|
      if @character.save
        format.html { redirect_to(first_step_character_wizard_path(:char_id => @character.id)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to(first_step_character_wizard_path(:char_id => @character.id)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to(characters_url) }
    end
  end

  private

  def fetch_character
    @character = current_user.characters.find_by_id(params[:id])
  end

end
