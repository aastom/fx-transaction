# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions Requests', type: :request do
  describe 'POST /api/v1/transactions with success' do
    it 'returns a transaction' do
      post_params = { customer_id: Faker::Crypto.md5,
                      input_amount: Faker::Commerce.price,
                      input_currency: "USD",
                      output_amount: Faker::Commerce.price,
                      output_currency: "GBP" }
      post '/api/v1/transactions', params: { transaction: post_params }
      json_response = JSON.parse(response.body).deep_symbolize_keys
      expect(json_response[:success]).to eq(true)
    end
  end

  describe 'POST /api/v1/transactions with nil customer_id' do
    it 'returns a transactions' do
      post_params = {
        input_amount: Faker::Commerce.price,
        input_currency: "USD",
        output_amount: Faker::Commerce.price,
        output_currency: "GBP"
      }
      post '/api/v1/transactions', params: { transaction: post_params }
      json_response = JSON.parse(response.body).deep_symbolize_keys
      expect(json_response[:success]).to eq(false)
    end
  end
end
