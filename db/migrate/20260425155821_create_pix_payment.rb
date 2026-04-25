class CreatePixPayment < ActiveRecord::Migration[8.1]
  def change
    create_table :pix_payments do |t|
      t.string :issuing_bank
      t.string :transaction_id
      t.string :pix_key
      t.string :payload
      t.timestamp :expires_at, null: false

      t.timestamps
    end
  end
end
