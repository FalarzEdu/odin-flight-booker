class CreateAirports < ActiveRecord::Migration[8.1]
  def change
    create_table :airports do |t|
      t.string :code, null: false
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
