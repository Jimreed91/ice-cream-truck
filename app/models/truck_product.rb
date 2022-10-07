class TruckProduct < ApplicationRecord
  belongs_to :truck
  belongs_to :product

  # Ex:- scope :active, -> {where(:active => true)}
  def stock
    start_quantity - sold
  end

  # def stock?

  # end

  def sell(num)
    sold += num
  end
end
