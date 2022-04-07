require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:username).of_type(:string) }
    it { is_expected.to have_db_column(:password_digest).of_type(:string) }
  end

  describe 'Index' do
    it { is_expected.to have_db_index(:email).unique(true) }
    it { is_expected.to have_db_index(:username).unique(true) }
  end

  describe 'Relations' do
    it { is_expected.to have_many(:contact_books).dependent(:destroy) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_length_of :password }

    it { is_expected.to allow_value('email@addresse.foo').for(:email) }
    it { is_expected.not_to allow_value('email').for(:email) }
  end
end
