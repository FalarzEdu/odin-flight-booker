class AddFlightRefToBookings < ActiveRecord::Migration[8.1]
  def change
    add_reference :bookings, :flight, null: false, foreign_key: true
  end
end
