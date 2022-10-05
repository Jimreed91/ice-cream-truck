class OrderController < ApplicationController

  def create
    @order = Order.new(truck_id: params[:truck_id])
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = Order.find(params[:id])
    order_product = @order.order_products.build(product_id: params[:product_id], quantity: params[:quantity] )
      if order_product.save
        render json: order_product
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end


  def delete
  end

  private

  def order_params
    params.require(:order).permit(:truck_id, order_product_attributes: [ :product_id, :quantity, :id ])
  end
end
