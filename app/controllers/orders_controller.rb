class OrdersController < ApplicationController
  before_action :set_order, only: %i[update commit]

  def create
    @order = Order.new(order_params)
    @order.truck_id = params[:truck_id]

    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    if @order.status == 'accepted'
      render status: 400, json: {
        error: 'Order has already been accepted!'
      }
    end

    if @order.update(order_params)
      render status: 200, json: {
        message: 'Order updated'
      }
    else
      render status: 400, json: {
        error: @order.errors.messages
      }
    end
  end

  def commit
    @truck = @order.truck

    @unavailable = @order.order_products.select do |order_product|
      truck_product = TruckProduct.find_by(truck: @truck,
                                           product: order_product.product)
      order_product.quantity > truck_product.stock
    end

    if @unavailable.empty? && @order.status == 'pending'
      @order.update!(status: 'accepted')
      @order.order_products.each do |op|
        truck_product = @truck.truck_products.find_by(product: op.product)
        truck_product.sell(op.quantity)
      end
      render status: 200, json: {
        message: 'ENJOY!'
      }
    else
      render status: 400, json: {
        message: 'SO SORRY!',
        cant_fill: @unavailable
      }
    end
  end

  def show
    @order = Order.find(order_params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:truck_id,
                                  :id,
                                  order_products_attributes: %i[product_id
                                                                quantity
                                                                id
                                                                _destroy])
  end

  def set_order
    @order = Order.find(params[:id])
  end

end
