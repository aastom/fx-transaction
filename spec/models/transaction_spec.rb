# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'must have a customer_id' do
    transaction = Transaction.new(customer_id: nil)
    expect(transaction).to_not be_valid
  end

  it 'must have a transaction_id' do
    transaction = Transaction.create({ customer_id: Faker::Crypto.md5,
                                       input_amount: Faker::Commerce.price,
                                       input_currency: "USD",
                                       output_amount: Faker::Commerce.price,
                                       output_currency: "GBP" })

    expect(transaction).to be_valid
  end

  it 'must have an input_amount' do
    transaction = Transaction.create({ customer_id: Faker::Crypto.md5,
                                       input_currency: "USD",
                                       output_amount: Faker::Commerce.price,
                                       output_currency: "GBP" })

    expect(transaction).to_not be_valid
  end

  it 'must have an input_currency' do
    transaction = Transaction.create({ customer_id: Faker::Crypto.md5,
                                       input_amount: Faker::Commerce.price,
                                       output_amount: "USD",
                                       output_currency: "GBP" })

    expect(transaction).to_not be_valid
  end

  it 'must have an output_amount' do
    expect do
      Transaction.create({ customer_id: Faker::Crypto.md5,
                           input_amount: Faker::Commerce.price,
                           input_currency: "USD",
                           output_currency: "EUR" })
    end.to raise_error(ActiveRecord::NotNullViolation)
  end

  it 'must have an output_currency' do
    transaction = Transaction.create({ customer_id: Faker::Crypto.md5,
                                       input_amount: Faker::Commerce.price,
                                       input_currency:"EUR",
                                       output_amount: Faker::Commerce.price })

    expect(transaction).to_not be_valid
  end

  it 'correctly determines the output_amount' do
    input_amount = Faker::Commerce.price
    output_amount = Transaction.calculate_output_amount(input_amount)
    expect(output_amount).to eq(input_amount * 2.3)
  end
end
