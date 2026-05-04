class Booking < ApplicationRecord
  belongs_to :flight
  belongs_to :user
  has_many :payments
  has_many :passengers

  accepts_nested_attributes_for :passengers

  enum :status, { pending_payment: 0, confirmed: 1 }, default: :pending_payment

  validates :status, presence: true
  validates :flight, presence: true
  validate :flight_must_be_in_the_future, on: :create
  validates :total_paid, presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :passengers, presence: { message: "at least one passenger must be included" }
  validate :passengers_count_within_limit, on: :create
  validates_associated :passengers

  scope :with_airport_codes, -> {
    includes(flight: { route: [ :departure_airport, :arrival_airport ] })
  }

  def passengers_limit
    4
  end

  private

  def flight_must_be_in_the_future
    if flight.present? && flight.departure_datetime < Time.current
      errors.add(:base, "Cannot book a flight that has already departed.")
    end
  end

  def passengers_count_within_limit
    if passengers.size > passengers_limit
      errors.add(:base, "You can't book more than #{passengers_limit} at once.")
    end
  end
end
