Rails.application.routes.draw do
  # Deviseのルート設定 学習用memo
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :items, only: [:index, :new, :create]
  # 商品一覧ページへのルート設定 学習用memo
  get 'items', to: 'items#index'
  
  # トップページへのルート設定 学習用memo
  root to: "items#index"
  
# 商品出品ページへのルート設定
get '/items/new', to: 'items#new', as: 'custom_new_item'

end
