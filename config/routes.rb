Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] do
    resources :bags, only: [:show, :new, :create] do
      resources :bookings, only: [:show, :new, :create]
    end
  end
  resources :bags, only: [:index]
end
