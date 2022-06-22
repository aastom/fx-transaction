class Transaction < ApplicationRecord
  def self.calculate_output_amount(input_amount)
    input_amount * 2.3
  end
end
