class Truck < ApplicationRecord
  has_many :truck_products, dependent: :destroy
  has_many :products, through: :truck_products
  has_many :orders

  def profit
    orders.sum(&:order_total)
  end
end
