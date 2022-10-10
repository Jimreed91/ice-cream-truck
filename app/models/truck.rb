class Truck < ApplicationRecord
  has_many :truck_products, dependent: :destroy
  has_many :products, through: :truck_products
  has_many :orders

  def profit
    orders.sum(&:order_total)
  end

  def self.all_trucks_profit
    all.sum(&:profit)
  end
end
