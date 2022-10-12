class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :order, :product, :quantity, presence: true

  before_commit :set_price



  def set_price
    update_column(:unit_price, product.price)
  end

end
