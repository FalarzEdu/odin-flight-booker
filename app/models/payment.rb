class Payment < ApplicationRecord
  enum :status, { pending: 0, paid: 1, denied: 2 }, default:  :pending
end
