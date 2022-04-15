require 'rails_helper'
require 'spec_helper'

RSpec.describe Contact, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:contact) { FactoryBot.create(:contact, contact_book: FactoryBot.create(:contact_book, user: user)) }

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
    subject { FactoryBot.create(:contact) }

    it { is_expected.to validate_length_of(:givenname).is_at_least(2).is_at_most(24) }
    it { is_expected.to validate_length_of(:surname).is_at_least(2).is_at_most(24) }
    it { is_expected.to validate_length_of(:phone).is_at_most(12)}
    it { is_expected.to validate_numericality_of(:phone)}

    it { is_expected.to validate_uniqueness_of(:email).scoped_to(:contact_book_id) }
    it { is_expected.to validate_uniqueness_of(:phone).case_insensitive.scoped_to(:contact_book_id) }

    it { is_expected.to allow_value('email@addresse.foo').for(:email) }
    it { is_expected.not_to allow_value('email').for(:email) }
  end

  describe 'Hooks' do
    describe '#after_update' do
      it 'create new and correct contact history' do
        old_surname = contact.surname

        expect { contact.update(surname: 'new surname for test') }.to change(ContactHistory, :count).by(1)

        expect(ContactHistory.last.surname).to eq(old_surname)
      end
    end
  end

  describe 'Methods' do
    describe '#owner_user_id' do
      it 'returns correct owner_user_id' do
        expect(contact.owner_user_id).to eq user.id
      end
    end
  end

  describe 'Filters' do
    before do
      FactoryBot.create_list(:contact, 3)
    end

    context 'filter_by contact_book_id' do
      let(:valid_contact) do
        FactoryBot.create(:contact)
      end

      it 'return the correct response' do
        response = Contact.filtrate(contact_book_id: valid_contact.contact_book_id)

        expect(response.count).to eq(1)
        expect(response.first.id).to eq(valid_contact.id)
      end
    end

    context 'filter_by fullname' do
      let(:valid_contact) do
        FactoryBot.create(:contact)
      end

      it 'return the correct response' do
        response = Contact.filtrate(fullname: "#{valid_contact.givenname} #{valid_contact.surname}")

        expect(response.count).to eq(1)
        expect(response.first.id).to eq(valid_contact.id)
      end
    end
  end
end
