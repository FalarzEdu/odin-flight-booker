class Booking < ApplicationRecord
  belongs_to :flight
  has_many :payments
  has_many :passengers

  accepts_nested_attributes_for :passengers

  enum :status, { pending_payment: 0, confirmed: 1 }, default: :pending_payment

  validates :status, presence: true
  validates :flight, presence: true
  validate :flight_must_be_in_the_future, on: :create
  validates :total_paid, presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates_associated :passengers

  private

  def flight_must_be_in_the_future
    if flight.present? && flight.departure_datetime < Date.current
      errors.add(:base, "Cannot book a flight that has already departed.")
    end
  end
end
