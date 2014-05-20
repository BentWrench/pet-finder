FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@factory.com" }

  factory :user do
    email
    password '74108520'
    role 'user'
  end

  factory :pet do
    species 'Bird'
    breed 'Eagle'
    description 'description'
    color 'Brown'
    loc_lost 'Downtown'
    lost true
    user
  end
end
