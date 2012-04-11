# -*- encoding : utf-8 -*-
CharMaker::Application.routes.draw do
  resources :characters

  #the list of non RESTful sins starts here...
  match 'character_wizards/set_shield_as_main/', :controller=> 'character_wizards', :action => 'set_shield_as_main'
  match 'character_wizards/update_ranged_weapons_select/', :controller=> 'character_wizards', :action => 'update_ranged_weapons_select'
  match 'character_wizards/update_armors_select/', :controller=> 'character_wizards', :action => 'update_armors_select'
  match 'character_wizards/update_weapons_select/', :controller=> 'character_wizards', :action => 'update_weapons_select'
  match 'character_wizards/update_shields_select/', :controller=> 'character_wizards', :action => 'update_shields_select'
  match 'character_wizards/update_countries_select/', :controller=> 'character_wizards', :action => 'update_countries_select'
  match 'character_wizards/toggle_skill/', :controller=> 'character_wizards', :action => 'toggle_skill'
  match 'character_wizards/toggle_weapon_proficiency/', :controller=> 'character_wizards', :action => 'toggle_weapon_proficiency'
  match 'character_wizards/set_skill_preference/', :controller=> 'character_wizards', :action => 'set_skill_preference'
  match 'character_wizards/add_item_to_inventory/', :controller=> 'character_wizards', :action => 'add_item_to_inventory'
  match 'character_wizards/remove_item_from_inventory/', :controller=> 'character_wizards', :action => 'remove_item_from_inventory'
  match 'character_wizards/improve_item/', :controller=> 'character_wizards', :action => 'improve_item'
  match 'character_wizards/revert_improvement/', :controller=> 'character_wizards', :action => 'revert_improvement'

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
      get :picking_spells_step
      post :picking_spells_step
    end
  end

  resources :messages, :only => [:new, :create]

  get "home/index"
  root :to => "home#index"
  devise_for :users


end
