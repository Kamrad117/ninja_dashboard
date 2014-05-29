Rails.application.routes.draw do

  resources :vcenters 

  get "vcenters/:id/:pool_name" => "vcenters#pool", as: :pool

  devise_for :users
  root to: "vcenters#index"
end
