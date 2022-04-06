require 'rails_helper'
require 'spec_helper'

RSpec.describe ContactHistory, type: :model do
  describe 'Fields' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:givenname).of_type(:string) }
    it { is_expected.to have_db_column(:surname).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:contact_id).of_type(:integer) }
  end

  describe 'Index' do
    it { is_expected.to have_db_index(:contact_id) }
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:contact) }
  end
end
