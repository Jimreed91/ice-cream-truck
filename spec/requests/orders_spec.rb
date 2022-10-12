require 'rails_helper'

RSpec.describe 'Orders', type: :request do
  # describe 'Post /orders' do
  #   it 'Creates a new order' do
  #     truck = FactoryBot.create(:truck)
  #     post "/trucks/#{truck.id}/orders/"
  #     expect(response).to have_http_status(201)
  #   end
  # end

  describe 'Post trucks/:id/orders' do
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
      json = JSON.parse(response.body)
      expect(response).to have_http_status(201)
      expect(truck.orders[0].products.length).to eq(2)
    end
  end

  describe 'Put /orders/:id' do
    it 'updates order details' do
      truck = FactoryBot.create(:truck, :with_truck_products)
      order = truck.orders.create()
      order.order_products.create(quantity: 5, product_id: 3)
      put "/orders/#{truck.orders.first.id}",
          params: { order: {
            order_products_attributes: [{ id: 1,
                                          quantity: 1,
                                          product_id: 1 }]
          } },
          as: :json
      p truck.orders.first.order_products
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(truck.orders[0].products.length).to eq(1)
      expect(truck.orders[0].order_products.first.quantity).to eq(1)
    end
  end

  # describe 'Put /orders' do
  #   it 'Increases truck profit by correct amount' do
  #     truck = FactoryBot.create(:truck, :with_truck_products)
  #     orders = truck.orders << FactoryBot.build(:order)
  #     quantity = rand(1..6)
  #     put "/trucks/#{truck.id}/orders/#{orders[0].id}",
  #         params: { order: { quantity: quantity,
  #                            product_id: truck.products.first.id } },
  #         as: :json
  #     expect(response).to have_http_status(200)
  #     expect(truck.profit).to eq(truck.products.first.price * quantity)
  #   end
  # end
end
