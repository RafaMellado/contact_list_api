require 'rails_helper'

RSpec.describe '/contact_books', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) do
    {
      name: 'a' * 10,
      user_id: user.id
    }
  end

  let(:invalid_attributes) do
    {
      name: 'a',
      user_id: nil
    }
  end

  let(:valid_headers) { { Authorization: JsonWebToken.encode(user_id: user.id) } }

  let(:model_keys) { %i[id name user_id created_at updated_at] }

  let!(:contact_book) { FactoryBot.create(:contact_book, user: user, id: 1000) }

  describe 'GET /index' do
    it_behaves_like 'authenticated action', { http_method: 'get', path: '/contact_books' }

    it 'renders a successful response' do
      get contact_books_url, headers: valid_headers, as: :json

      expect(response).to be_successful
      expect(json_hash.first.keys).to match_array model_keys
    end
  end

  describe 'GET /show' do
    it_behaves_like 'authenticated action', { http_method: 'get', path: '/contact_books/1000' }

    it 'renders a successful response' do
      get contact_book_url(contact_book), headers: valid_headers, as: :json

      expect(response).to be_successful
      expect(json_hash.keys).to match_array model_keys << :contacts
    end
  end

  describe 'POST /create' do
    it_behaves_like 'authenticated action', { http_method: 'post', path: '/contact_books' }

    context 'with valid parameters' do
      it 'creates a new ContactBook' do
        expect do
          post contact_books_url,
               params: { data: valid_attributes }, headers: valid_headers, as: :json
        end.to change(ContactBook, :count).by(1)

        expect(response).to have_http_status(:created)
        expect(json_hash.keys).to match_array model_keys
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ContactBook' do
        expect do
          post contact_books_url,
               params: { data: invalid_attributes }, as: :json
        end.to change(ContactBook, :count).by(0)
      end

      it 'renders a JSON response with errors for the new contact_book' do
        post contact_books_url,
             params: { data: invalid_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /update' do
    it_behaves_like 'authenticated action', { http_method: 'put', path: '/contact_books/1000' }

    context 'with valid parameters' do
      let(:new_attributes) { { name: 'test' } }

      it 'updates the requested contact_book' do
        put contact_book_url(contact_book),
            params: { data: new_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:ok)
        expect(json_hash.keys).to match_array model_keys
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the contact_book' do
        put contact_book_url(contact_book),
            params: { data: invalid_attributes }, headers: valid_headers, as: :json

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it_behaves_like 'authenticated action', { http_method: 'delete', path: '/contact_books/1000' }

    it 'destroys the requested contact_book' do
      expect do
        delete contact_book_url(contact_book), headers: valid_headers, as: :json
      end.to change(ContactBook, :count).by(-1)
    end
  end
end
