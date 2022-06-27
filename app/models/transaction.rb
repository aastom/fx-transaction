# frozen_string_literal: true

# Transaction stores and tracks fx transactions
class Transaction < ApplicationRecord
  validates :customer_id, :input_amount, :input_currency, :output_currency, presence: true
  validates :input_amount, numericality: { greater_than: 0 }

  # validate currency code
  validates :input_currency, :output_currency,
            inclusion: { in: %w[USD EUR GBP], message: '%<value>s is not a valid currency code' }

  def self.calculate_output_amount(input_amount)
    input_amount * 2.3
  end

  def self.clean(transaction)
    transaction.attributes.except('id')
  end

  def self.cleanall(transactions)
    transactions.map { |transaction| clean(transaction) }
  end
end
