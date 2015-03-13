Rails.application.routes.draw do

  resources :preps

  resources :cases do
    resources :reviews
  end
  resources :givers
  resources :users
  resources :sessions

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"

  root to: "cases#index"

end
