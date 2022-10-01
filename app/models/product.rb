class Product < ApplicationRecord
  has_many :truck_products
  has_many :trucks, through: :truck_products
  enum product_type: { snackbar: 0, shaved_ice: 1, icecream: 2 }
end
