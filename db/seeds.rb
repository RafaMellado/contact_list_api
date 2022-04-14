require_relative 'seeds/naruto'
require_relative 'seeds/shingeki'


user = FactoryBot.create(:user, email: 'user@email.com', username: 'username', password: '123456')

create_seed_naruto(user)
create_seed_shingeki(user)