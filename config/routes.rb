Rails.application.routes.draw do
  root to: "pages#index"
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :pets   #, :except => []

end
