FactoryBot.define do
  factory :contact do
    givenname { Faker::Name.unique.name[0..23] }
    surname { Faker::Name.unique.last_name[0..23] }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.subscriber_number(length: 10).to_i }
    contact_book { FactoryBot.create(:contact_book) }
  end
end
