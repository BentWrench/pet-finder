Rails.application.routes.draw do
  devise_for :users
  root to: "pets#index"

  resources :users

  resources :pets   #, :except => []

end
