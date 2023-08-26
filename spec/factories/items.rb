FactoryBot.define do   # ここの名前はカラム名
  factory :item do
    association :user
    name { 'テスト商品' }
    description { 'これはテスト商品です。' }
    price { 1000 }
    category_id { 1 }
    status_id { 1 }
    delivery_fee_burden_id { 1 }
    days_until_shipping_id { 1 }
    prefecture_id { 1 }

  end
end
