class PurchaseShippingInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Use 3 digits, hyphen, and 4 digits format' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Use 10 or 11 digits without hyphen' }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(item_id:, user_id:)
    ShippingInfo.create(
      purchase:,
      postal_code:,
      prefecture_id:,
      city:,
      address:,
      building:,
      phone_number:
    )
  end
end
