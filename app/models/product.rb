class Product < ApplicationRecord
  has_many :truck_products
  has_many :trucks, through: :truck_products

  validates :type, inclusion: %w[Icecream Snackbar ShavedIce]

  scope :icecreams, -> { where(type: 'Icecream') }
  scope :snackbars, -> { where(type: 'Snackbar') }
  scope :shaved_ices, -> { where(type: 'ShavedIce') }

  def truck_stock(truck)
    truck_products.find_by(truck: truck).stock
  end
end
