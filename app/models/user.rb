class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :date_of_birth, comparison: {
                                          greater_than_or_equal_to: 120.year.ago,
                                          lesser_than: -> { Time.current },
                                          message: "must be a valid birth date"
                                        }
  validates :name, length: { minimum: 2, maximum: 100 }
end
