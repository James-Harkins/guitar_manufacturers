class Manufacturer < ApplicationRecord
  has_many :guitars
  validates_presence_of :name
  validates :name, format: { with: /\A[a-zA-Z ]+\z/, message: "Only allows letters, integers, spaces, and hyphens." }
  validates_presence_of :headquarter_city
  validates :headquarter_city, format: { with: /\A[a-zA-Z ]+\z/, message: "Only allows letters and spaces." }
  validates_presence_of :years_in_business
  validates :years_in_business, numericality: { greater_than: 0, only_integer: true, message: "Only allows integers greater than zero." }
  validates :custom_shop, inclusion: [true, false]
  validates :custom_shop, exclusion: [nil]

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
