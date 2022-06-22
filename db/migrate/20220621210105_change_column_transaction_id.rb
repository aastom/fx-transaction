# frozen_string_literal: true

class ChangeColumnTransactionId < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :transaction_id, :uuid, null: false, using: 'transaction_id::uuid'
  end
end
