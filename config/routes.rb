Rails.application.routes.draw do
  resources :perfomances
  resources :reviews
  resources :sessions
  root "home#index"
end
