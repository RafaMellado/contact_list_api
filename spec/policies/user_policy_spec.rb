require 'rails_helper'

RSpec.describe UserPolicy, type: :policy do
  subject(:policy) { described_class.new(user, nil, nil) }

  let(:user) { FactoryBot.create(:user) }

  describe 'actions' do
    context 'when user do actions' do
      it { is_expected.to permit_actions(%i[create]) }
    end
  end
end
