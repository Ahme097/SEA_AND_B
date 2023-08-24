Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users

  resources :users do
    get 'my_bookings', to: 'bookings#user_bookings', on: :member
    get 'all_bookings', to: 'bookings#all_bookings', as: :all_bookings
    get 'user_yachts', to: 'yachts#user_yachts', on: :member
  end

  resources :yachts do
    resources :reviews
    get 'yacht_bookings', to: 'bookings#yacht_bookings', on: :member
  end

  resources :users do
    resources :bookings, only: [:show]
    resources :yachts, only: [:index, :new, :create, :edit] do
      resources :bookings, only: [:index, :new, :create]
    end
  end

  resources :about, only: [:index]
  get '/yachts', to: 'yachts#index'
  get '/yachts/:id', to: 'yachts#show', as: 'yacht_show'
  get 'owner_yachts/:user_id', to: 'yachts#owner_yachts', as: :owner_yachts

end
