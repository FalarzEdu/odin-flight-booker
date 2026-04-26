class CreateFlights < ActiveRecord::Migration[8.1]
  def change
    create_table :flights do |t|
      t.string :identifier_code, null: false
      t.datetime :departure_datetime, null: false
      t.datetime :arrival_datetime, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
