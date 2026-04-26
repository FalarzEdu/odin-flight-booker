class CreateCities < ActiveRecord::Migration[8.1]
  def change
    create_table :cities do |t|
      t.string :state, null: false
      t.string :country, null: false
      t.string :name, null: false
      t.string :abbreviation, null: false

      t.timestamps
    end
  end
end
