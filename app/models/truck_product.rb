class TruckProduct < ApplicationRecord
  belongs_to :truck
  belongs_to :product
end
