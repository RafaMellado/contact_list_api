require 'faker'

def create_seed_shingeki(user)
  contact_book = FactoryBot.create(:contact_book, name: 'Shingeki no Kyojin', user: user)

  FactoryBot.create(
    :contact,
    givenname: 'Eren',
    surname: 'Jaeger',
    email: 'eren.jaeger@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Armin',
    surname: 'Arlert',
    email: 'armin_arlert@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Mikasa',
    surname: 'Ackerman',
    email: 'mikasa.ackerman@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Levi',
    surname: 'Ackerman',
    email: 'levi.ackerman@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Erwin',
    surname: 'Smith',
    email: 'erwin.smith@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Hange',
    surname: 'Zoë',
    email: 'hange.zoe@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Sasha',
    surname: 'Blouse',
    email: 'sasha_food@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Reiner',
    surname: 'Braun',
    email: 'reiner_braun@marley.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Historia',
    surname: 'Reiss',
    email: 'historia_reiss@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Annie',
    surname: 'Leonhart',
    email: 'annie.leonhart@marley.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Bertolt',
    surname: 'Hoover',
    email: 'bertolt.123@marley.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Dot',
    surname: 'Pixis',
    email: 'pixis.major@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Connie',
    surname: 'Springer',
    email: 'connie.springer@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Pieck',
    surname: 'Finger',
    email: 'pieck.finger@marley.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Floch',
    surname: 'Forster',
    email: 'floch.floster@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Keith',
    surname: 'Shadis',
    email: 'keith_shadis@shiganshina.com',
    phone: random_phone_number,
    contact_book: contact_book
  )

  FactoryBot.create(
    :contact,
    givenname: 'Zeke',
    surname: 'Yaeger',
    email: 'zeke.yaeger@marley.com',
    phone: random_phone_number,
    contact_book: contact_book
  )
end

def random_phone_number
  Faker::Number.unique.between(from: 6_000_000, to: 799_999_999)
end