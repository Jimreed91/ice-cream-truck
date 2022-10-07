class OrderController < ApplicationController
  before_action :set_product, :set_order, :set_truck_product, only: [:update]

  def create
    @order = Order.new(truck_id: params[:truck_id])
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @truck_product.stock >= order_params[:quantity]
      total_sold = @truck_product.sold + order_params[:quantity]
      @truck_product.update_attribute(:sold, total_sold)
      order_product = @order.order_products.build(product: @product,
                                                  quantity: order_params[:quantity])

      if order_product.save
        render status: 200, json: {
          message: 'ENJOY',
          product: @product.name,
          type: @product.type,
          quantity: order_params[:quantity]
        }
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    else
      render status: 400, json: { message: 'SO SORRY',
                                  stock_remaining: @truck_product.stock }
    end
  end

  def delete; end

  private

  def order_params
    params.require(:order).permit(:truck_id, :product_id, :quantity, :id)
  end

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def set_product
    @product = Product.find(order_params[:product_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_truck_product
    @truck_product = TruckProduct.find_by(truck_id: params[:truck_id],
                                          product_id: order_params[:product_id])
  end
end
