class PixPayment < ApplicationRecord
  has_one :payment, as: :payment_method

  validates :issuing_bank, :transaction_id, :pix_key, :payload, presence: true
  validates :expires_at, presence: true,
            numericality: true,
            comparison: {
              greater_than: 0,
              less_than_or_equal_to: -> { 30.minutes.from_now },
              message: "a pix expiration can not be negative nor longer than 30 minutes"
            }
end
