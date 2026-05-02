class RemoveVerificationNumberFromCardInformations < ActiveRecord::Migration[8.1]
  def change
    remove_column :card_informations, :verification_number, :integer
  end
end
