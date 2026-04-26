class AddFlightDurationToFlights < ActiveRecord::Migration[8.1]
  def change
    add_column :flights, :flight_duration, :decimal, precision: 2, scale: 2, null: false
  end
end
