class TrucksController < ApplicationController
  def show
    @truck = Truck.find(params[:id])
    render json: @truck
  end

end
