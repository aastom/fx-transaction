# frozen_string_literal: true

class AddTransactionDateToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :transaction_date, :datetime
  end
end
