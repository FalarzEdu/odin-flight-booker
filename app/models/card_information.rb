class CardInformation < ApplicationRecord
  belongs_to :user
  has_many :card_payments

  validates :card_number, :card_owner, :card_owner_document, :active, presence: true
  validates :card_verification_number, numericality: { only_integer: true },
                                       length: { minimum: 3, maximum: 4 }
  validates :user, presence: true
end
