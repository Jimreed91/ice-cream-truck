class Order < ApplicationRecord
  belongs_to :truck
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  # total price for order
  def order_total
    order_products.sum(&:product_total)
  end
end