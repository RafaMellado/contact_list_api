require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) do
    {
      email: user.email,
      password: user.password
    }
  end

  let(:invalid_attributes) do
    {
      email: '',
      password: ''
    }
  end

  let(:model_keys) { %i[exp token username] }

  describe 'POST /login' do
    context 'with valid parameters' do
      it 'creates a new JWT' do
        post '/auth/login', params: valid_attributes, as: :json

        expect(response).to have_http_status(:ok)
        expect(json_hash.keys).to match_array model_keys
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new JWT' do
        expect do
          post '/auth/login',
               params: invalid_attributes, as: :json
        end.to change(ContactBook, :count).by(0)
      end

      it 'renders a JSON response with errors for the new JWT' do
        post '/auth/login',
             params: invalid_attributes, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
