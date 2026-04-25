class CreatePassengers < ActiveRecord::Migration[8.1]
  def change
    create_table :passengers do |t|
      t.string :name, null: false
      t.date :date_of_birth, null: false

      t.timestamps
    end
  end
end
