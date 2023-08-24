Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'items', to: 'items#index'
  root to: "items#index"
end
