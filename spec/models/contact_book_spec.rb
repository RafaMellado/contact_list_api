require 'rails_helper'
require 'spec_helper'

RSpec.describe ContactBook, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
  end

  describe 'Index' do
    it { is_expected.to have_db_index(:user_id) }
  end

  describe 'Relations' do
    it { is_expected.to have_many(:contacts).dependent(:destroy) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'Validations' do
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }

    context 'length' do
      let(:contact_book) { FactoryBot.create(:contact_book) }

      it 'minimum' do
        contact_book.update(name: 'aaa')

        expect(contact_book).to be_invalid
      end

      it 'maximum' do
        contact_book.update(name: 'a' * 21)

        expect(contact_book).to be_invalid
      end

      it 'correct value' do
        contact_book.update(name: 'a' * 20)

        expect(contact_book).to be_valid
      end
    end
  end
end
