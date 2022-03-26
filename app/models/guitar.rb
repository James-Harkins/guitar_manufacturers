class Guitar < ApplicationRecord
  belongs_to :manufacturer
  validates_presence_of :model

  def self.only_six_strings
    where(six_string: true)
  end
end
