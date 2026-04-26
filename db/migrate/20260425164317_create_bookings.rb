class CreateBookings < ActiveRecord::Migration[8.1]
  def change
    create_table :bookings do |t|
      t.decimal :total_paid, precision: 10, scale: 2, null: false, default: 0
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
