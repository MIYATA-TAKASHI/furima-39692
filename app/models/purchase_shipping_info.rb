class PurchaseShippingInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addres, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :addres
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Delivery.create(
      postal_code:,
      prefecture_id:,
      city:,
      addres:,
      building:,
      phone_number:,
      purchase_id: purchase.id
    )
  end
end

# purchase
# postal_code
# prefecture_id
# city
# address
# building
# phone_number
