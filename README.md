# Contact List APP - API

This project is an API that allows you to manage your contacts in differents contact books.

You can create contact contact books, create contacts within these contact books and show the updates history of each contact

## Requirements

- Ruby 2.7.5
- Rails 7.0.2.3

## How to start

### Configuration

1. Install `bundler`

```bash
gem install bundler
```

2. Install dependencies

```bash
bundle install
```

3. Create database and load schema

```bash
bundle exec rails db:setup
```

This will create default data too (implements with seeds)

### Execution

```bash
bundle exec rails s
```

## Additional gems used in this project

### Global

- [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.11?locale=es): Gem used to safely handling passwords
- [jwt](https://rubygems.org/gems/jwt): Gem used to manage authentication
- [active_record_filterable](https://rubygems.org/gems/active_record_filterable): Gem used to manage model filters easier
- [rails_authorize](https://rubygems.org/gems/rails_authorize): Authorization system (like Pundit)

### Dev and tests

- [annotate](https://rubygems.org/gems/annotate): Gem used to add annotations to models, routes... based on the database schema
- [faker](https://rubygems.org/gems/faker): Gem used to generate fake data
- [pry](https://rubygems.org/gems/pry): This gem allows to us to stop the runtime invocation and check data (like byebug or debugger)
- [factory_bot_rails](https://rubygems.org/gems/factory_bot_rails): Gem used to create factories

### Only for dev

- [bullet](https://rubygems.org/gems/bullet): Gem used to help to identify N+1 queries

### Only for tests

- [rspec-rails](https://rubygems.org/gems/rspec-rails): Gem used to create unit tests
- [capybara](https://rubygems.org/gems/capybara): Gem used to create e2e tests
- [database_cleaner](https://rubygems.org/gems/database_cleaner): Gem used to clean database on testing
- [rails_authorize_matchers](https://github.com/pacop/rails_authorize_matchers): Gem used to manage authorization tests
- [shoulda-matchers](https://rubygems.org/gems/shoulda-matchers): Gem used to implements helpers to use with rspec
