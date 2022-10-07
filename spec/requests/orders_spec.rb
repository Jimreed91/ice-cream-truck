require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'Post /order' do
    it 'Creates a new order' do
      truck = FactoryBot.create(:truck)
      post "/trucks/#{truck.id}/order/"
      expect(response).to have_http_status(201)
    end
  end

  describe 'Put /order' do
    it 'Adds item to order if enough in stock' do
      truck = FactoryBot.create(:truck, :with_truck_products)
      orders = truck.orders << FactoryBot.build(:order)

      put "/trucks/#{truck.id}/order/#{orders[0].id}",
          params: { order: { quantity: 5, product_id: truck.products.first.id } },
          as: :json
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json['message']).to eq('ENJOY')
      expect(orders[0].products.length).to eq(1)
    end
  end

  describe 'Put /order' do
    it 'Does not add item to order if not in stock' do
      truck = FactoryBot.create(:truck, :with_truck_products)
      orders = truck.orders << FactoryBot.build(:order)

      put "/trucks/#{truck.id}/order/#{orders[0].id}",
          params: { order: { quantity: 11,
                             product_id: truck.products.first.id } },
          as: :json
      json = JSON.parse(response.body)
      expect(response).to have_http_status(400)
      expect(json['message']).to eq('SO SORRY')
      expect(orders[0].products.length).to eq(0)
    end
  end

  describe 'Put /order' do
    it 'Increases truck profit by correct amount' do

      truck = FactoryBot.create(:truck, :with_truck_products)
      orders = truck.orders << FactoryBot.build(:order)
      quantity = rand(1..6)
      put "/trucks/#{truck.id}/order/#{orders[0].id}",
          params: { order: { quantity: quantity,
                             product_id: truck.products.first.id } },
          as: :json
      expect(response).to have_http_status(200)
      expect(truck.profit).to eq(truck.products.first.price * quantity)
    end
  end
end
