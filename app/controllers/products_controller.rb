class ProductsController < ApplicationController
  before_action :set_product, only: %i[update show]

  def create
    @product = Product.new(product_params)
    if @product.save
      render status: 201,
             json: { message: 'Created successfully',
                     product: @product }
    else
      render status: 400, json: { error: @product.errors.messages }
    end
  end

  def update
    @product.update(product_params)
    if @product.save
      render status: 200,
             json: { message: 'Updated successfully',
                     product: @product }
    else
      render status: 400, json: { error: @product.errors.messages }
    end
  end

  def index
    @products = Product.all

    render  status: 200,
            json: { products: @products }
  end

  def show
    render status: 200,
           json: {
             product: @product.name,
             type: @product.type,
             price: @product.price
           }
  end

private
  def product_params
    params.require(:product).permit(:price, :type, :name)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
