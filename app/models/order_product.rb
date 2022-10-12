class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order, :product, :quantity, presence: true

  before_save :set_price

  private

  def set_price
    self.unit_price = product.price
  end
end
