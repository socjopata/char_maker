# -*- encoding : utf-8 -*-
CharMaker::Application.routes.draw do
  resources :characters

  resource 'character_wizard', :only => [:show, :create] do
    member do
      get :update_countries_select
      get :update_deities_select
      get :toggle_spell
      get :set_armor_as_main
      get :set_shield_as_main
      get :update_ranged_weapons_select
      get :update_armors_select
      get :update_weapons_select
      get :update_shields_select
      get :toggle_skill
      get :toggle_weapon_proficiency
      get :set_skill_preference
      get :add_item_to_inventory
      get :remove_item_from_inventory
      get :improve_item
      get :revert_improvement
    end
  end

  resources :messages, :only => [:new, :create]

  get "home/index"
  root :to => "home#index"
  devise_for :users


end
