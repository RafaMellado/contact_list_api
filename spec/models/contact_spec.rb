require 'rails_helper'
require 'spec_helper'

RSpec.describe Contact, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:givenname).of_type(:string) }
    it { is_expected.to have_db_column(:surname).of_type(:string) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
  end

  describe 'Index' do
    it { is_expected.to have_db_index(:contact_book_id) }
  end

  describe 'Relations' do
    it { is_expected.to have_many(:contact_histories).dependent(:destroy) }
    it { is_expected.to belong_to(:contact_book) }
  end

  describe 'Validations' do
    it { is_expected.to allow_value("email@addresse.foo").for(:email) }
    it { is_expected.not_to allow_value("email").for(:email) }
  end

  describe 'Methods' do
    describe '#owner_user_id' do
    end
  end

  describe 'Hooks' do
    describe '#after_update' do

    end
  end
end
