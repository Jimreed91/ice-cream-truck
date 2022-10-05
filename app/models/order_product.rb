class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_price
  # total price for this product in chosen quantity
  def product_total
    unit_price * quantity
  end

  private

  def set_price
    self.unit_price = product.price
  end
end
