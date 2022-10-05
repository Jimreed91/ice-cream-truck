class Product < ApplicationRecord
  has_many :truck_products
  has_many :trucks, through: :truck_products

  scope :icecreams, -> { where(type: 'Icecream') }
  scope :snackbars, -> { where(type: 'Snackbar') }
  scope :shaved_ices, -> { where(type: 'ShavedIce') }
  # Ex:- scope :active, -> {where(:active => true)}
  # Ex:- scope :active, -> {where(:active => true)}
end
