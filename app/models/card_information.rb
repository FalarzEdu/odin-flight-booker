class CardInformation < ApplicationRecord
  belongs_to :user
  has_many :card_payments

  validates :number, :owner_full_name, :owner_document, presence: true
  validates :active, inclusion: { in: [true, false] }
  validates :user, presence: true

  enum :active, { inactive: 0, active: 1 }, default: :active
end
