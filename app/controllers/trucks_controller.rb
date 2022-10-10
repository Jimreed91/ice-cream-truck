class TrucksController < ApplicationController
  def show
    @truck = Truck.find(params[:id])
  end

  def index
    @trucks = Truck.all
  end
end
# products.icecream.as_json(only: [:name, :price]),
#   render json: {
#     truck_id: @truck.id,
#     icecreams: @truck.truck_products.as_json(include: :product),
#     snackbars: @truck.products.snackbars,
#     shaved_ices: @truck.products.shaved_ices
#   }
# end
