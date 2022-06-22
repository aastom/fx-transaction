# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions Requests', type: :request do
  describe 'GET /api/v1/transactions/:id with success' do
    it 'returns a transaction' do
      transaction = Transaction.create({ customer_id: Faker::Crypto.md5,
                                         input_amount: Faker::Commerce.price,
                                         input_currency: Faker::Currency.code,
                                         output_amount: Faker::Commerce.price,
                                         output_currency: Faker::Currency.code })
      get "/api/v1/transactions/#{transaction.transaction_id}"
      json_response = JSON.parse(response.body).deep_symbolize_keys
      expect(json_response[:success]).to eq(true)
    end
  end

  describe 'GET /api/v1/transactions/:id with failed' do
    it 'returns a not found transaction' do
      transaction_id = Faker::Crypto.md5
      get "/api/v1/transactions/#{transaction_id}"
      json_response = JSON.parse(response.body).deep_symbolize_keys
      expect(json_response[:success]).to eq(false)
    end
  end
end
