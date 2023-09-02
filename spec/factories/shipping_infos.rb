FactoryBot.define do
  factory :order do
    Faker::Config.locale = 'ja'
    postal_code { Faker::Address.postcode }
    prefecture_id { Faker::Number.within(range: 1..47) }
    city { Faker::Address.city }
    address { Faker::Address.building_number }
    building_name { Faker::Address.community }
    phone_number { Faker::Number.number(digits: 10) }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user
    association :item
  end
end
