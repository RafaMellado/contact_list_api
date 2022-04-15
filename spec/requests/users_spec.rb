require 'rails_helper'

RSpec.describe '/users', type: :request do
  let(:valid_attributes) do
    {
      username: 'b' * 10,
      email: 'test@email.es',
      password: '123456',
      password_confirmation: '123456'
    }
  end

  let(:invalid_attributes) do
    {
      username: 'a' * 10
    }
  end

  let(:model_keys) { %i[id username email password_digest created_at updated_at] }

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post users_url,
               params: valid_attributes, as: :json
        end.to change(User, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(json_hash.keys).to match_array model_keys
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post users_url,
               params: invalid_attributes, as: :json
        end.to change(ContactBook, :count).by(0)
      end

      it 'renders a JSON response with errors for the new user' do
        post users_url,
             params: invalid_attributes, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
