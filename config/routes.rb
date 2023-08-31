Rails.application.routes.draw do

  devise_for :users 
  resources :items, only: [:index, :new, :create, :show, :edit]

  resources :items do
    resources :purchases
  end

  root to: "items#index"
end
