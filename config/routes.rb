# -*- encoding : utf-8 -*-
CharMaker::Application.routes.draw do
  resources :characters do
    member do
      get :print
    end
  end

  match 'character_wizards/update_countries_select/:id', :controller=> 'character_wizards', :action => 'update_countries_select'

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
    end
  end

  get "home/index"
  root :to => "home#index"
  devise_for :users


end
