FactoryBot.define do
  factory :contact_book do
    name { Faker::Name.unique.name[0..19] }
    user_id { create(:user).id }
  end
end
