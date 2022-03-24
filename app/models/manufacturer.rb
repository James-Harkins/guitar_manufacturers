class Manufacturer < ApplicationRecord
  has_many :guitars

  def self.order_descending
    order("created_at desc")
  end

  def count
    guitars.count
  end
end
