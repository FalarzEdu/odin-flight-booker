class CardInformation < ApplicationRecord
  belongs_to :user
  has_many :card_payments

  validates :number, :owner_full_name, :owner_document, presence: true
  validates :active, inclusion: { in: [ true, false ] }
  validates :user, presence: true

  scope :active, -> { where(active: true) }
end
