class Product < ApplicationRecord
  has_many :truck_products
  has_many :trucks, through: :truck_products

end
