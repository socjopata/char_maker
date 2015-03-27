# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
  end

  def show
  end

  def example_character_list
    @characters = User.find_by_email("socjopata@gmail.com").characters.where(finished: true).order("name")
  end

  def example_character_show
    @character_sheet = CharacterSheet.new(User.find_by_email("socjopata@gmail.com").characters.where(id: params[:id]).first)
    render :layout => 'office'
  end
end