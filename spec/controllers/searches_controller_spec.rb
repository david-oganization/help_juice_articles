require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe 'POST #create' do
    it 'creates a new search with valid search term' do
      post :create, params: { search_term: 'example' }
      expect(Search.count).to eq(1)
      expect(Search.last.search_term).to eq('example')
      expect(Search.last.user_ip).to eq(request.remote_ip)
      expect(response).to have_http_status(:ok)
    end

    it 'does not create a new search without search term' do
      post :create, params: { search_term: '' }
      expect(Search.count).to eq(0)
      expect(response).to have_http_status(:ok)
    end
  end
end
