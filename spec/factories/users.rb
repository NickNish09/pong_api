FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username(specifier: 5..8) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    role { :player }
    preferred_hand { :right }
    gender { :male }
    uid { email }
    confirmed_at { Time.now } # This is necessary if you're using Devise's confirmable module

    trait :admin do
      role { :admin }
    end

    trait :left_handed do
      preferred_hand { :left }
    end

    trait :female do
      gender { :female }
    end

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
