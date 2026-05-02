class Passenger < ApplicationRecord
  belongs_to :booking

  validates :name, presence: true
  validates :date_of_birth, presence: true,
                            comparison: {
                              greater_than: 120.years.ago,
                              less_than_or_equal_to: -> { Time.current },
                              message: "must be a valid birth date"
                            }
  validates :booking, presence: true
end
