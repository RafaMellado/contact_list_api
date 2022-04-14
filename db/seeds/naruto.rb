require 'faker'

def create_seed_naruto(user)
  contact_book = FactoryBot.create(:contact_book, name: 'Naruto', user: user)

  FactoryBot.create(
    :contact,
    givenname: 'Naruto',
    surname: 'Uzumaki',
    email: 'naruto_uzumaki@konoha.com',
    phone: '666666666',
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Sasuke',
    surname: 'Uchiha',
    email: 'sasuke_uchiha@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Sakura',
    surname: 'Haruno',
    email: 'sakura_haruno@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Kakashi',
    surname: 'Hatake',
    email: 'kakashi_hatake@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Tsunade',
    surname: 'Senju',
    email: 'lady_tsunade@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Hinata',
    surname: 'Hyuga',
    email: 'hinata_hyuga@sunagakure.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Shikamaru',
    surname: 'Nara',
    email: 'shikamaru_nara@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Maito',
    surname: 'Gai',
    email: 'maito_gai@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Rock',
    surname: 'Lee',
    email: 'rock_lee@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Ino',
    surname: 'Yamanaka',
    email: 'ino_yamanaka@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Konohamaru',
    surname: 'Sarutobi',
    email: 'konohamaru@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Kiba',
    surname: 'Inuzuka',
    email: 'kiba_dogs@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Temari',
    surname: 'Nara',
    email: 'temari_nara@konoha.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Gaara',
    surname: 'Yuzawa',
    email: 'gaara_yuzawa@sunagakure.com',
    phone: random_phone_number,
    contact_book: contact_book
  )
end

def random_phone_number
  Faker::Number.unique.between(from: 6_000_000, to: 799_999_999)
end