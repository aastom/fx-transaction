# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :transaction_id, null: false
      t.string :customer_id, null: false
      t.float :input_amount, null: false
      t.string :input_currency, null: false
      t.float :output_amount, null: false
      t.string :output_currency, null: false

      t.timestamps
    end
    add_index :transactions, :transaction_id, unique: true
  end
end
