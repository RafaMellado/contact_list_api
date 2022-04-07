require 'rails_helper'

RSpec.describe ContactBooksController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/contact_books').to route_to('contact_books#index')
    end

    it 'routes to #show' do
      expect(get: '/contact_books/1').to route_to('contact_books#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/contact_books').to route_to('contact_books#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/contact_books/1').to route_to('contact_books#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/contact_books/1').to route_to('contact_books#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/contact_books/1').to route_to('contact_books#destroy', id: '1')
    end
  end
end
