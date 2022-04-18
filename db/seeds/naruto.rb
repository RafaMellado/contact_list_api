require 'faker'

NARUTO_CONTACTS = [
  {
    givenname: 'Naruto',
    surname: 'Uzumaki',
    email: 'naruto_uzumaki@konoha.com',
    phone: '666666666'
  },
  {
    givenname: 'Sasuke',
    surname: 'Uchiha',
    email: 'sasuke_uchiha@konoha.com'
  },
  {
    givenname: 'Sakura',
    surname: 'Haruno',
    email: 'sakura_haruno@konoha.com'
  },

  {
    givenname: 'Kakashi',
    surname: 'Hatake',
    email: 'kakashi_hatake@konoha.com'
  },
  {
    givenname: 'Tsunade',
    surname: 'Senju',
    email: 'lady_tsunade@konoha.com'
  },
  {
    givenname: 'Hinata',
    surname: 'Hyuga',
    email: 'hinata_hyuga@sunagakure.com'
  },
  {
    givenname: 'Shikamaru',
    surname: 'Nara',
    email: 'shikamaru_nara@konoha.com'
  },
  {
    givenname: 'Maito',
    surname: 'Gai',
    email: 'maito_gai@konoha.com'
  },
  {
    givenname: 'Rock',
    surname: 'Lee',
    email: 'rock_lee@konoha.com'
  },
  {
    givenname: 'Ino',
    surname: 'Yamanaka',
    email: 'ino_yamanaka@konoha.com'
  },
  {
    givenname: 'Konohamaru',
    surname: 'Sarutobi',
    email: 'konohamaru@konoha.com'
  },
  {
    givenname: 'Kiba',
    surname: 'Inuzuka',
    email: 'kiba_dogs@konoha.com'
  },
  {
    givenname: 'Temari',
    surname: 'Nara',
    email: 'temari_nara@konoha.com'
  },
  {
    givenname: 'Gaara',
    surname: 'Yuzawa',
    email: 'gaara_yuzawa@sunagakure.com'
  }
].freeze

def create_seed_naruto(user)
  contact_book = FactoryBot.create(:contact_book, name: 'Naruto', user: user)

  NARUTO_CONTACTS.each do |item|
    FactoryBot.create(
      :contact,
      givenname: item[:givenname],
      surname: item[:surname],
      email: item[:email],
      phone: item[:phone] || random_phone_number,
      contact_book: contact_book
    )
  end
end

def random_phone_number
  Faker::Number.unique.between(from: 6_000_000, to: 799_999_999)
end
