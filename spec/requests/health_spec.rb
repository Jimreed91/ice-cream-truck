require 'rails_helper'

RSpec.describe 'Healths', type: :request do
  describe 'GET /index' do
    it "returns 200: healthy" do
      get '/health/'
      expect(response.status).to eq(200)
      expect(response.body).to eq('{"status":"online"}')
    end
  end
end
