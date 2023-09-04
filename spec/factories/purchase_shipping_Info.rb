FactoryBot.define do
  factory :purchase_shipping_info do
    postal_code     { Faker::Address.postcode }
    prefecture_id   { Faker::Number.between(from: 1, to: 47) }
    city            { Faker::Address.city }
    address         { Faker::Address.building_number }
    building        { Faker::Address.community }
    phone_number    { Faker::Number.number(digits: 10) }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
