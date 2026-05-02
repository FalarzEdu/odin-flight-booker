class RemoveCardPrefixFromCardInformationsColumns < ActiveRecord::Migration[8.1]
  def change
    rename_column :card_informations, :card_number, :number
    rename_column :card_informations, :card_owner, :owner_full_name
    rename_column :card_informations, :card_owner_document, :owner_document
    rename_column :card_informations, :card_verification_number, :verification_number
  end
end
