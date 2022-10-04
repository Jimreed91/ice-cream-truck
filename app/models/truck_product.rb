class TruckProduct < ApplicationRecord
  belongs_to :truck
  belongs_to :product

  # Ex:- scope :active, -> {where(:active => true)}
  def stock
    start_quantity - sold
  end
end
