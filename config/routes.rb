Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :users do
    get 'my_bookings', to: 'bookings#user_bookings', on: :member
  end

  resources :yachts do
    get 'yacht_bookings', to: 'bookings#yacht_bookings', on: :member
  end

  resources :users do
    resources :bookings, only: [:show]
    resources :yachts, only: [:index, :show] do
      resources :bookings, only: [:index, :new, :create]
      resources :reviews
    end
  end

  get '/yachts', to: 'yachts#index'
  get '/yachts/:id', to: 'yachts#show', as: 'yacht_show'

  # Define other routes for your application
end
