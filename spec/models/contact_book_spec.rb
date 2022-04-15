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

  describe 'Filters' do
    before do
      FactoryBot.create_list(:contact_book, 3)
    end

    context 'filter_by name' do
      let(:valid_contact_book) do
        FactoryBot.create(:contact_book)
      end

      it 'return the correct response' do
        response = ContactBook.filtrate(name: valid_contact_book.name)

        expect(response.count).to eq(1)
        expect(response.first).to eq(valid_contact_book)
      end
    end
  end
end
