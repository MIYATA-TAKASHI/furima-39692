FactoryBot.define do
  factory :item do
    user { nil }
    name { "MyString" }
    category_id { 1 }
    description { "MyText" }
    price { 1 }
    status_id { 1 }
    delivery_fee_burden_id { 1 }
    prefecture_id { 1 }
    days_until_shipping_id { 1 }
  end
end
