require 'rails_helper'

RSpec.describe 'Products', type: :request do
  before(:each) do
    puts 'running before'
    @truck = FactoryBot.create(:truck, :with_truck_products)
  end
  describe 'POST /products/' do
    it 'creates a new product with valid params' do
      post '/products/',
           params: { product: { type: 'Icecream', price: 150, name: 'Rum and raisin' } },
           as: :json
      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)
      expect(json['message']).to eq('Created successfully')
    end
  end

  describe 'PUT /products/:id' do
    it 'returns http success' do
      product = @truck.products[rand(1..2)]
      put "/products/#{product.id}/",
          params: { product: { type: 'Icecream', price: 150, name: 'Chunky Bacon' } },
          as: :json
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json['product']['name']).to eq('Chunky Bacon')
    end
  end

  describe 'GET /products/' do
    it 'returns http success' do
      get '/products/'
      expect(response).to have_http_status(200)
    end
  end

end
