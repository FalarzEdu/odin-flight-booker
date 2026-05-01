class Flight < ApplicationRecord
  belongs_to :route

  has_many :bookings

  scope :with_departure_airport, ->(id) {
    joins(:route).where(routes: { departure_airport_id: id })
  }

  scope :with_arrival_airport, ->(id) {
    joins(:route).where(routes: { arrival_airport_id: id })
  }

  scope :with_exact_departure_date, ->(date) {
    where(departure_datetime: date)
  }

  def self.available_dates
    all.map { |flight| flight.departure_datetime.to_date }.uniq.sort
  end
end
