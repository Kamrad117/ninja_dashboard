Rails.application.routes.draw do
  resources :vcenters

  devise_for :users
  root to: "vcenters#index"
end
