class Guitar < ApplicationRecord
  belongs_to :manufacturer
  validates_presence_of :model
  validates :model, format: { with: /\A[a-zA-Z0-9 \-]+\z/, message: "Only allows letters, integers, spaces, and hyphens." }
  validates_presence_of :num_of_frets
  validates :num_of_frets, numericality: { only_integer: true, less_than: 37, greater_than: 11, message: "Only allows integers between 12 and 36." }
  validates :six_string, inclusion: [true, false]
  validates :six_string, exclusion: [nil]

  def self.only_six_strings
    where(six_string: true)
  end
end
