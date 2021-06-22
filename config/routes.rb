Rails.application.routes.draw do
  devise_for :users
  get 'spaces/index'
  root to: "spaces#index"
  resources :users, only: [:edit, :update]
end
