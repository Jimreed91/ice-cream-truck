class OrderProductsController < ApplicationController
  before_action :set_order, only: [:create]

  def create
   render json: @order
  end

  private

  def order_product_params
    params.permit(:product_id, :quantity, :commit)
  end


  private

  def set_order
    puts(1111111111111111111111111)
    puts(session)
    begin
    @order = Order.find(session[:order_id])

    rescue
      @order = Order.create(truck_id: 1)
      session[:order_id] = @order.id
    end
  end
end
