class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  # total price for this product in chosen quantity
  def product_total
    unit_price * quantity
  end
end
