# config/routes.rb

Rails.application.routes.draw do
  # ここに他のルート設定があるかもしれません

  # items/index アクションに対するルートを設定
  get 'items', to: 'items#index'
end
