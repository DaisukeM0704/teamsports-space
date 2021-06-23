Rails.application.routes.draw do
  devise_for :teams, controllers: {
    sessions:      'teams/sessions',
    passwords:     'teams/passwords',
    registrations: 'teams/registrations'
  }
  
  root 'teams#index'

  resources :teams, only: [:edit, :update]
  
  devise_for :users

  resources :users, only: [:edit, :update]
end