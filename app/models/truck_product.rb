class TruckProduct < ApplicationRecord
  belongs_to :truck
  belongs_to :product


  # Ex:- scope :active, -> {where(:active => true)}
  def stock
    product.start_quantity - number_sold
  end
end
