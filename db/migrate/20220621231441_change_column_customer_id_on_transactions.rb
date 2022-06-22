# frozen_string_literal: true

class ChangeColumnCustomerIdOnTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :customer_id, :string, null: false, using: 'customer_id::varchar'
  end
end
