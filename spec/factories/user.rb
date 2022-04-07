FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 6..19) }
    email { Faker::Internet.unique.email }
    password { '123456' }
  end
end
