class Booking < ApplicationRecord
  enum :status, { pending_payment: 0, confirmed: 1 }, default: :pending_payment
end
