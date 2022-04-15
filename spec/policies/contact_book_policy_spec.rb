require 'rails_helper'

RSpec.describe ContactBookPolicy, type: :policy do
  subject(:policy) { described_class.new(user, contact_book, nil) }

  let(:contact_book) { FactoryBot.create(:contact_book) }
  let(:user) { FactoryBot.create(:user) }

  describe 'actions' do
    context 'when user not owned contact book' do
      it { is_expected.to permit_actions(%i[index]) }
      it { is_expected.to forbid_actions(%i[create show update destroy]) }
    end

    context 'when user owned contact book' do
      before do
        contact_book.update(user: user)
      end

      it { is_expected.to permit_actions(%i[index create show update destroy]) }
    end
  end

  describe 'scope' do
    context 'when use scope' do
      let!(:valid_contact_book) { FactoryBot.create(:contact_book, user: user) }

      before do
        FactoryBot.create_list(:contact_book, 3)
      end

      it 'returns only the owned contact books' do
        expect(policy.scope.count).to eq(1)
        expect(policy.scope.first.id).to eq(valid_contact_book.id)
      end
    end
  end
end
