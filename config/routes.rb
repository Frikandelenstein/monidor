Rails.application.routes.draw do
  get 'dashboard/index'

  resources :features


  root "dashboard#index"
end
