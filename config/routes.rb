Rails.application.routes.draw do
  resources :bookings do
    belongs_to :user
    belongs_to :yacht
  end
  # users resource
  resources :users do
    devise_for :users
  end
  # yachts resource
  resources :yachts do
    has_many :bookings
    has_many :reviews
  end
  # reviews resource
  resources :reviews do
    belongs_to :yacht
  end
    end
end
