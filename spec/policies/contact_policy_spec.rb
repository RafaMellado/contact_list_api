require 'rails_helper'

RSpec.describe ContactPolicy, type: :policy do
  subject(:policy) { described_class.new(user, contact, nil) }

  let(:contact) { FactoryBot.create(:contact) }
  let(:user) { FactoryBot.create(:user) }

  describe 'actions' do
    context 'when user not owned contact' do
      it { is_expected.to permit_actions(%i[index]) }
      it { is_expected.to forbid_actions(%i[create show update destroy]) }
    end

    context 'when user owned contact' do
      before do
        contact.update(contact_book: FactoryBot.create(:contact_book, user: user))
      end

      it { is_expected.to permit_actions(%i[index create show update destroy]) }
    end
  end

  describe 'scope' do
    context 'when use scope' do
      let!(:valid_contact) do
        FactoryBot.create(:contact, contact_book: FactoryBot.create(:contact_book, user: user))
      end

      before do
        FactoryBot.create_list(:contact, 3)
      end

      it 'returns only the owned contacts' do
        expect(policy.scope.count).to eq(1)
        expect(policy.scope.first.id).to eq(valid_contact.id)
      end
    end
  end
end
