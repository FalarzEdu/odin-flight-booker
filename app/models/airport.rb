class Airport < ApplicationRecord
  belongs_to :city

  validates :name, :code, presence: true
  validates :code, uniqueness: true

  validates_associated :city
end
