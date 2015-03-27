# -*- encoding : utf-8 -*-
class CharactersController < ApplicationController
  before_filter :create_guest_user_if_needed
  before_filter :user_signed_in?
  before_filter :fetch_character, except: [:index, :create, :new]

  def index
    @characters = current_user.characters.where(finished: true).order("name")
    respond_to do |format|
      format.html
    end
  end

  def show
    @character_sheet = CharacterSheet.new(@character)
    render layout: 'office'
  end

  def edit
  end

  def new
    params[:char_id].present? ? @character = current_user.characters.find(params[:char_id]) : @character = current_user.characters.build
    respond_to do |format|
      format.html
    end
  end

  def create
    @character = current_user.characters.build(params[:character])
    respond_to do |format|
      if @character.save
        format.html { redirect_to(character_wizard_path(char_id: @character.id, step: "profession_and_origin")) }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @character.update_attributes(params[:character])
        format.html { redirect_to(character_wizard_path(char_id: @character.id, step: "profession_and_origin")) }
      else
        format.html { render action: "edit" }
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

  def create_guest_user_if_needed
    if current_user.blank?
      user = User.create_guest and sign_in(:user, user)
      @current_user = user
    end
  end

  def fetch_character
    @character = current_user.characters.find_by_id(params[:id])
  end
end