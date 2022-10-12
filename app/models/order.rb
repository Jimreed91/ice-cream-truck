class Order < ApplicationRecord
  belongs_to :truck
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  validates :truck, presence: true

  after_commit :set_total
  accepts_nested_attributes_for :order_products, reject_if: :all_blank, allow_destroy: true, update_only: true

  def set_total
    update_column(:total, order_products.sum('order_products.unit_price * order_products.quantity'))
  end
end
