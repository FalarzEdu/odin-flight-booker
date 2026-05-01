class Flight < ApplicationRecord
  belongs_to :route
  has_many :bookings

  validates :departure_datetime, presence: true,
            comparison: { greater_than_or_equal_to: -> { Time.current } }

  validates :arrival_datetime, presence: true,
            comparison: { greater_than: :departure_datetime }

  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  validates :capacity, :flight_duration, presence: true,
            numericality: { greater_than: 0 }

  validates :route, presence: true

  scope :upcoming, -> { where("departure_datetime >= ?", Date.current) }

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
    upcoming.map { |flight| flight.departure_datetime.to_date }.uniq.sort
  end
end
