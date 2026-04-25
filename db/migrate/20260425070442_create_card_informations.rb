class CreateCardInformations < ActiveRecord::Migration[8.1]
  def change
    create_table :card_informations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :card_number
      t.string :card_owner
      t.integer :card_verification_number
      t.string :card_owner_document
      t.boolean :active

      t.timestamps
    end
  end
end
