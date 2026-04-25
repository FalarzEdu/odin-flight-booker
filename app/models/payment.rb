class Payment < ApplicationRecord
  enum :status, { pendent: 0, paid: 1, denied: 2 }, default:  :pendent
end
