Rails.application.routes.draw do
  resources :staffs
  resources :schedules
  resources :planes
  resources :xroutes
  resources :hubs
  resources :cities
  resources :plane_models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
