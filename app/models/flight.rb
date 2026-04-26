class Flight < ApplicationRecord
  belongs_to :route

  has_many :bookings
end
