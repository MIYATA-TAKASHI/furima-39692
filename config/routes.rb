Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :items, only: [:index, :new, :create]
 
  get 'items', to: 'items#index'
  get '/users/:id', to: 'users#show', as: :user

  root to: "items#index"
  

end
