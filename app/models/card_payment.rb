class CardPayment < ApplicationRecord
  has_one :payment, as: :payment_method

  validates :card_information_id, presence: true
end
