class RemoveIdentifierCodeFromFlights < ActiveRecord::Migration[8.1]
  def change
    remove_column :flights, :identifier_code, :string
  end
end
