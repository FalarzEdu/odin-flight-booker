class Flight < ApplicationRecord
  belongs_to :flight

  has_many :bookings
end
