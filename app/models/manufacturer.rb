class Manufacturer < ApplicationRecord
  has_many :guitars

  def self.order_descending
    order("created_at desc")
  end

  def guitar_count
    guitars.count
  end

  def alphabetical_guitars
    guitars.order(:model)
  end

  def guitars_with_frets_over(minimum_frets)
    guitars.where("num_of_frets > #{minimum_frets}")
  end
end
