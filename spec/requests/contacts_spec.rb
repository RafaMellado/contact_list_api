require 'rails_helper'

RSpec.describe '/contact_books', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_contact_book) { FactoryBot.create(:contact_book, user: user) }
  let(:valid_attributes) do
    {
      givenname: 'a' * 10,
      surname: 'b' * 10,
      email: 'test@email.es',
      phone: '123456789',
      contact_book_id: valid_contact_book.id
    }
  end

  let(:invalid_attributes) do
    {
      givenname: 'a',
      contact_book_id: valid_contact_book.id
    }
  end

  let(:valid_headers) { { Authorization: JsonWebToken.encode(user_id: user.id) } }

  let(:model_keys) { %i[id givenname surname email phone contact_book_id created_at updated_at] }

  let!(:contact) do
    FactoryBot.create(
      :contact,
      id: 1000,
      contact_book: valid_contact_book
    )
  end

  describe 'GET /index' do
    it_behaves_like 'authenticated action', { http_method: 'get', path: '/contacts' }

    it 'renders a successful response' do
      get contacts_url, headers: valid_headers, as: :json

      expect(response).to be_successful
      expect(json_hash.first.keys).to match_array model_keys
    end
  end

  describe 'GET /show' do
    it_behaves_like 'authenticated action', { http_method: 'get', path: '/contacts/1000' }

    it 'renders a successful response' do
      get contact_url(contact), headers: valid_headers, as: :json

      expect(response).to be_successful
      expect(json_hash.keys).to match_array model_keys << :contact_histories
    end
  end

  describe 'POST /create' do
    it_behaves_like 'authenticated action', { http_method: 'post', path: '/contacts' }

    context 'with valid parameters' do
      it 'creates a new Contact' do
        expect do
          post contacts_url,
               params: valid_attributes, headers: valid_headers, as: :json
        end.to change(Contact, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(json_hash.keys).to match_array model_keys
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Contact' do
        expect do
          post contacts_url,
               params: invalid_attributes, as: :json
        end.to change(Contact, :count).by(0)
      end

      it 'renders a JSON response with errors for the new contact' do
        post contacts_url,
             params: invalid_attributes, headers: valid_headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /update' do
    it_behaves_like 'authenticated action', { http_method: 'put', path: '/contacts/1000' }

    context 'with valid parameters' do
      let(:new_attributes) { { name: 'test' } }

      it 'updates the requested contact' do
        put contact_url(contact),
            params: new_attributes, headers: valid_headers, as: :json

        expect(response).to have_http_status(:ok)
        expect(json_hash.keys).to match_array model_keys
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the contact' do
        put contact_url(contact),
            params: invalid_attributes, headers: valid_headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it_behaves_like 'authenticated action', { http_method: 'delete', path: '/contacts/1000' }

    it 'destroys the requested contact' do
      expect do
        delete contact_url(contact), headers: valid_headers, as: :json
      end.to change(Contact, :count).by(-1)
    end
  end
end
