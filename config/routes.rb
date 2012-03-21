# -*- encoding : utf-8 -*-
CharMaker::Application.routes.draw do
  resources :characters do
    member do
      get :print
    end
  end

  #the list of non RESTful sins...
  match 'character_wizards/update_weapons_select/', :controller=> 'character_wizards', :action => 'update_weapons_select'
  match 'character_wizards/update_countries_select/', :controller=> 'character_wizards', :action => 'update_countries_select'
  match 'character_wizards/toggle_skill/', :controller=> 'character_wizards', :action => 'toggle_skill'
  match 'character_wizards/toggle_weapon_proficiency/', :controller=> 'character_wizards', :action => 'toggle_weapon_proficiency'
  match 'character_wizards/set_skill_preference/', :controller=> 'character_wizards', :action => 'set_skill_preference'

  resource 'character_wizard' do
    member do
      get :first_step
      post :first_step
      get :second_step
      post :second_step
      get :third_step
      post :third_step
      get :fourth_step
      post :fourth_step
      get :pick_a_fightstyle_step
      post :pick_a_fightstyle_step
      get :after_skills_step
      post :after_skills_step
      get :armament_step
      post :armament_step
    end
  end

  resources :messages, :only => [:new, :create]

  get "home/index"
  root :to => "home#index"
  devise_for :users


end
