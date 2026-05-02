class AddDefaultValueToActiveOnCardInformations < ActiveRecord::Migration[8.1]
  def change
    change_column_default :card_informations, :active, from: nil, to: true
  end
end
