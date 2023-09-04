class PurchaseShippingInfo
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code,       format: { with: /\A[\d]{3}-[\d]{4}\z/ }
    validates :prefecture_id,   numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number,    format: { with: /\A[\d]{10,11}\z/ }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    ShippingInfo.create(
      purchase: purchase,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )
  end

end
