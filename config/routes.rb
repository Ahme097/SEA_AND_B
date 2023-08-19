Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :yachts do
    resources :reviews
    resources :bookings
  end
end
