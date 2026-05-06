class RenamePolymorphicColumnFromPayments < ActiveRecord::Migration[8.1]
  def change
    rename_column :payments, :payable_type, :payment_method_type
    rename_column :payments, :payable_id, :payment_method_id
  end
end
