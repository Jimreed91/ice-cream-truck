require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  describe 'POST trucks/:id/orders' do
    it 'creates an order with valid attributes' do
      truck = FactoryBot.create(:truck, :with_truck_products)
      post "/trucks/#{truck.id}/orders/",
           params: { order: {
             order_products_attributes: [{ quantity: 5,
                                           product_id: 1 },
                                         { quantity: 5,
                                           product_id: 2 }]
           } },
           as: :json
      expect(response).to have_http_status(201)
      expect(truck.orders[0].products.length).to eq(2)
      expect(truck.profit).to eq(0)
    end
  end

  describe 'PUT /orders/:id' do
    it 'updates order details' do
      truck = FactoryBot.create(:truck, :with_truck_products)
      order = truck.orders.create
      order.order_products.create(quantity: 5, product_id: 3)
      put "/orders/#{truck.orders.first.id}",
          params: { order: {
            order_products_attributes: [{ id: 1,
                                          quantity: 1,
                                          product_id: 1 }]
          } },
          as: :json
      p truck.orders.first.order_products
      expect(response).to have_http_status(200)
      expect(truck.orders[0].products.length).to eq(1)
      expect(truck.orders[0].order_products.first.quantity).to eq(1)
    end
  end

  describe 'PATCH .orders/:id' do
    it 'accepts order if stock is available' do
      truck = FactoryBot.create(:truck, :with_truck_products, :with_order)
      truck.orders.first.order_products.create([
                                                 { product: truck.products[0], quantity: 3 },
                                                 { product: truck.products[1], quantity: 3 }
                                               ])
      patch "/orders/#{truck.orders.first.id}"
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json['message']).to eq('ENJOY!')
      expect(truck.profit).to eq(300)
      expect(truck.products[0].truck_products[0].sold).to eq(3)
      expect(truck.products[0].truck_products[0].stock).to eq(7)
    end
  end

  describe 'PATCH .orders/:id' do
    it 'does not accept order if not enough stock' do
      truck = FactoryBot.create(:truck, :with_truck_products, :with_order)
      truck.orders.first.order_products.create([
                                                 { product: truck.products[0], quantity: 3 },
                                                 { product: truck.products[1], quantity: 11 }
                                               ])
      patch "/orders/#{truck.orders.first.id}"
      json = JSON.parse(response.body)
      expect(response).to have_http_status(400)
      expect(json['message']).to eq('SO SORRY!')
      expect(truck.profit).to eq(0)
      expect(truck.products[0].truck_products[0].sold).to eq(0)
      expect(truck.products[0].truck_products[0].stock).to eq(10)
    end
  end
end
