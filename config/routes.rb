Rails.application.routes.draw do
  resources :teams
  get 'dashboard/index'

  resources :features


  root "dashboard#index"
end
