# frozen_string_literal: true

class ChangeColumnTransactionIdOnTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :transaction_id, :uuid, null: false, default: 'uuid_generate_v4()'
  end
end
