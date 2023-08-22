FactoryBot.define do
  factory :user do
    nickname { 'テストユーザー' }
    email { Faker::Internet.email }
    password { 'password123' }
    last_name { '山田' }
    first_name { '太郎' }
    kana_last_name { 'ヤマダ' }
    kana_first_name { 'タロウ' }
    birthdate { Date.new(1990, 1, 1) }

    trait :invalid_nickname do
      nickname { '' }
    end

    trait :invalid_email do
      email { 'invalid_email' }
    end

    trait :invalid_last_name do
      last_name { '123' }
    end

    trait :invalid_first_name do
      first_name { '123' }
    end

    trait :invalid_kana_last_name do
      kana_last_name { 'かな' }
    end

    trait :invalid_kana_first_name do
      kana_first_name { 'かな' }
    end

    trait :invalid_birthdate do
      birthdate { nil }
    end
  end
end
