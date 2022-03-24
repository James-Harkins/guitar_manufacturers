class Guitar < ApplicationRecord
  belongs_to :manufacturer
  validates_presence_of :model  
end
