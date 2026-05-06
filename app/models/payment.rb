class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :payment_method, polymorphic: true

  validates :amount, presence: true,
            numericality: true,
            comparison: {
              greater_than: 0,
              message: "negative value payments aren't allowed"
            }
  validates :payment_method_id, :payment_method_type, :booking_id, presence: true

  enum :status, { pending: 0, paid: 1, denied: 2 }, default:  :pending
end
