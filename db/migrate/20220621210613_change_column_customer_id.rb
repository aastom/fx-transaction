class ChangeColumnCustomerId < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :customer_id, :uuid, null: false, using: 'customer_id::uuid'
  end
end
