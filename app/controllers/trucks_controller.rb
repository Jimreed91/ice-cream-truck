class TrucksController < ApplicationController
  def show
    @truck = Truck.find(params[:id])
    render status:200
    # render json: {
    #   truck_id: @truck.id,
    #   icecreams: @truck.truck_products.as_json(include: :product),
    #   snackbars: @truck.products.snackbar,
    #   shaved_ices: @truck.products.shaved_ice
    # }
  end
end
# products.icecream.as_json(only: [:name, :price]),
