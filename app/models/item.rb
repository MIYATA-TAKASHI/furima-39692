class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :days_until_shipping
  belongs_to_active_hash :delivery_fee_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_burden_id,  numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :days_until_shipping_id, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  validates :image, presence: true
end
