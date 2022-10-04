class Truck < ApplicationRecord
  has_many :truck_products
  has_many :products, through: :truck_products
end
