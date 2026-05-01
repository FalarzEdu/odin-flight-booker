class Booking < ApplicationRecord
  belongs_to :flight
  has_many :payments
  has_many :passengers

  enum :status, { pending_payment: 0, confirmed: 1 }, default: :pending_payment

  validates :status, presence: true
  validates :flight, presence: true
  validates :total_paid, presence: true,
            numericality: { greater_than_or_equal_to: 0 }
end
