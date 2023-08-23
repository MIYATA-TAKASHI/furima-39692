FactoryBot.define do
  factory :user do
    nickname { 'テストユーザー' }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    kana_last_name { Faker::Name.kana_last_name }
    kana_first_name { Faker::Name.kana_first_name }
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
