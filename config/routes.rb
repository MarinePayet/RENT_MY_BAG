Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show]
  resources :bags, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :bookings, only: [:show, :new, :create, :destroy]
    end
  resources :bags, only: [:index]
  resources :bookings, only: [:destroy]
  get "profile", to: "profiles#me", as: :profile
end
