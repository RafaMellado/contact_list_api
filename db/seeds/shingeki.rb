require 'faker'

SHINGEKI_CONTACTS = [
  {
    givenname: 'Eren',
    surname: 'Jaeger',
    email: 'eren.jaeger@shiganshina.com'
  },
  {
    givenname: 'Armin',
    surname: 'Arlert',
    email: 'armin_arlert@shiganshina.com'
  },
  {
    givenname: 'Mikasa',
    surname: 'Ackerman',
    email: 'mikasa.ackerman@shiganshina.com'
  },
  {
    givenname: 'Levi',
    surname: 'Ackerman',
    email: 'levi.ackerman@shiganshina.com'
  },
  {
    givenname: 'Erwin',
    surname: 'Smith',
    email: 'erwin.smith@shiganshina.com'
  },
  {
    givenname: 'Hange',
    surname: 'Zoë',
    email: 'hange.zoe@shiganshina.com'
  },
  {
    givenname: 'Sasha',
    surname: 'Blouse',
    email: 'sasha_food@shiganshina.com'
  },
  {
    givenname: 'Reiner',
    surname: 'Braun',
    email: 'reiner_braun@marley.com'
  },
  {
    givenname: 'Historia',
    surname: 'Reiss',
    email: 'historia_reiss@shiganshina.com'
  },
  {
    givenname: 'Annie',
    surname: 'Leonhart',
    email: 'annie.leonhart@marley.com'
  },
  {
    givenname: 'Bertolt',
    surname: 'Hoover',
    email: 'bertolt.123@marley.com'
  },
  {
    givenname: 'Dot',
    surname: 'Pixis',
    email: 'pixis.major@shiganshina.com'
  },
  {
    givenname: 'Connie',
    surname: 'Springer',
    email: 'connie.springer@shiganshina.com'
  },
  {
    givenname: 'Pieck',
    surname: 'Finger',
    email: 'pieck.finger@marley.com'
  },
  {
    givenname: 'Floch',
    surname: 'Forster',
    email: 'floch.floster@shiganshina.com'
  },
  {
    givenname: 'Keith',
    surname: 'Shadis',
    email: 'keith_shadis@shiganshina.com'
  },
  {
    givenname: 'Zeke',
    surname: 'Yaeger',
    email: 'zeke.yaeger@marley.com'
  }

].freeze

def create_seed_shingeki(user)
  contact_book = FactoryBot.create(:contact_book, name: 'Shingeki no Kyojin', user: user)

  SHINGEKI_CONTACTS.each do |item|
    FactoryBot.create(
      :contact,
      givenname: item[:givenname],
      surname: item[:surname],
      email: item[:email],
      phone: random_phone_number,
      contact_book: contact_book
    )
  end
end

def random_phone_number
  Faker::Number.unique.between(from: 6_000_000, to: 799_999_999)
end
