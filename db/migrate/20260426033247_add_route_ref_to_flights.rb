class AddRouteRefToFlights < ActiveRecord::Migration[8.1]
  def change
    add_reference :flights, :route, null: false, foreign_key: true
  end
end
