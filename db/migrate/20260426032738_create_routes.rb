class CreateRoutes < ActiveRecord::Migration[8.1]
  def change
    create_table :routes do |t|
      t.decimal :distance, precision: 8, scale: 2, null: false

      t.references :departure_city, null: false, foreign_key: { to_table: :cities }
      t.references :arrival_city, null: false, foreign_key: { to_table: :cities }

      t.timestamps
    end
  end
end
