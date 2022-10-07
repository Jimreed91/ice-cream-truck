class TruckProduct < ApplicationRecord
  belongs_to :truck
  belongs_to :product

  validates :truck, :product, presence: true

  def stock
    start_quantity - sold
  end
end
