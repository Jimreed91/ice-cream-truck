require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      get '/products/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/products/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/products/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /delete' do
    it 'returns http success' do
      get '/products/delete'
      expect(response).to have_http_status(:success)
    end
  end
end
