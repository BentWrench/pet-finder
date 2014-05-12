Rails.application.routes.draw do
  root to: 'pet#index'

 resources :pets   #, :except => []

end
