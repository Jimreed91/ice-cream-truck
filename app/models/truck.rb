class Truck < ApplicationRecord
  has_many :truck_products, dependent: :destroy
  has_many :products, through: :truck_products
  has_many :orders

  def profit
    orders.where(status: 'accepted').sum(:total)
  end

  def self.all_trucks_profit
    Order.all.where(status: 'accepted').sum(:total)
  end
end
