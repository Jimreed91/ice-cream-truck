class TrucksController < ApplicationController
  def show
    @truck = Truck.find(params[:id])
  end

  def index
    @trucks = Truck.all
  end
end
