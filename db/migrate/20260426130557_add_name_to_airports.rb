class AddNameToAirports < ActiveRecord::Migration[8.1]
  def change
    add_column :airports, :name, :string, null: false
  end
end
