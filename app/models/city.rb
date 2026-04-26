class City < ApplicationRecord
  validates :state, :country, :name, :abbreviation, presence: true
end
