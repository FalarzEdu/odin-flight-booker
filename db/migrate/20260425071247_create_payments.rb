class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.integer :status, default: 0, null: false

      t.references :payable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
