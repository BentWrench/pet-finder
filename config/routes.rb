Rails.application.routes.draw do
  root to: "pages#index"

  devise_for :users

  resources :users, only: [:index, :show, :destroy]
  match '/users/admin/new', via: :get, to: 'users#new'
  match '/users/admin/new', via: :post, to: 'users#create'

  match '/pets/search', via: :get, to: 'pets#search'
  resources :pets do
    resources :messages, only: [:new, :create]
  end



end
