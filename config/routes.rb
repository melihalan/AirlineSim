Rails.application.routes.draw do
  resources :staffs
  resources :schedules
  resources :planes
  resources :xroutes
  resources :hubs
  resources :plane_models

  resources :countries do
    get :filter, on: :collection
  end

  resources :cities do
    get :filter, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
