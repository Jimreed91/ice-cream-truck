# class OrderProductsController < ApplicationController
#   before_action :set_order, only: [:create]

#   def create
#     # binding.byebug
#     # if stock_check > order_product_params[:quantity]
#       @order.order_products.new(order_product_params)
#       @order.save
#         render json: @order.order_products

#   end

#   def update
#   end

#   private

#   def order_product_params
#     params.require(:order_products).permit(:product_id, :quantity)
#   end

#   # If there is no order in session create one and add its id
#   def set_order
#     if session[:order_id].nil?
#       @order = Order.create(truck_id: params[:truck_id])
#       session[:order_id] = @order.id
#     else
#       @order = Order.find(session[:order_id])
#     end
#   end

#   def stock_check
#     product = Product.find(order_product_params[:product_id])
#     product_stock = product.truck_products.find_by(params[:truck_id]).stock
#   end

# end
