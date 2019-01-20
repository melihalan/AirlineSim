Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, path: "", path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :staffs
  resources :schedules
  resources :planes do
    get :buy, on: :collection
    get :order, on: :collection
  end
  resources :xroutes
  resources :hubs
  resources :books
  resources :investments
  resources :running_costs
  resources :slots_allocations
  resources :territories

  resources :plane_models do
    get :filter, on: :collection
    get :detail, on: :collection
  end

  resources :countries do
    get :filter, on: :collection
  end

  resources :cities do
    get :filter, on: :collection
    get :detail, on: :collection
  end

  resources :plane_model_families do
    get :filter, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
