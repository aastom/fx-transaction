# frozen_string_literal: true

# Transaction stores and tracks fx transactions
class Transaction < ApplicationRecord
  validates :customer_id, :input_amount, :input_currency, :output_currency, presence: true
  validates :input_amount, numericality: true

  def self.calculate_output_amount(input_amount)
    input_amount * 2.3
  end
end
