class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  # ... (その他の関連とバリデーションなど)

end
