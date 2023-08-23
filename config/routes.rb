Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :users do
    get 'my_bookings', to: 'bookings#user_bookings', on: :member
    get 'all_bookings', to: 'bookings#all_bookings', as: :all_bookings
  end


  resources :yachts do
    get 'yacht_bookings', to: 'bookings#yacht_bookings', on: :member
  end

  resources :yachts do
    resources :reviews
  end

  resources :users do
    resources :bookings, only: [:show]
    resources :yachts, only: [:index, :show] do
      resources :bookings, only: [:index, :new, :create]
    end
  end

  get '/yachts', to: 'yachts#index'
  get '/yachts/:id', to: 'yachts#show', as: 'yacht_show'

end
