Rails.application.routes.draw do
  devise_for :teams, controllers: {
    sessions:      'teams/sessions',
    passwords:     'teams/passwords',
    registrations: 'teams/registrations'
  }
  
  root 'teams#index'

  resources :teams, only: [:edit, :update]
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, only: [:edit, :update]
end