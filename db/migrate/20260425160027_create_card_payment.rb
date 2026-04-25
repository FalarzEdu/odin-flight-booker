class CreateCardPayment < ActiveRecord::Migration[8.1]
  def change
    create_table :card_payments do |t|
      t.references :card_information, null: false, foreign_key: true

      t.timestamps
    end
  end
end
