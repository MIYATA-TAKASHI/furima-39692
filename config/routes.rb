Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :items, only: [:index, :new, :create, :show]

  root to: "items#index"
end
