Rails.application.routes.draw do
  get 'spaces/index'
  root to: "spaces#index"
end
