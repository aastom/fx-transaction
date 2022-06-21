class ChangeTransactionDateOnTransactions < ActiveRecord::Migration[7.0]
  def change
    change_column :transactions, :transaction_date, :datetime, default: DateTime.now
  end
end
