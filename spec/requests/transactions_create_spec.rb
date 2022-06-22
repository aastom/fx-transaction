# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions Requests', type: :request do
  describe 'POST /api/v1/create with success' do
    it 'returns a transaction' do
      post_params = { customer_id: Faker::Crypto.md5,
                      input_amount: Faker::Commerce.price,
                      input_currency: Faker::Currency.code,
                      output_amount: Faker::Commerce.price,
                      output_currency: Faker::Currency.code }
      post '/api/v1/create', params: { transaction: post_params }
      json_response = JSON.parse(response.body).deep_symbolize_keys
      expect(json_response[:success]).to eq(true)
    end
  end

  describe 'POST /api/v1/create with nil customer_id' do
    it 'returns a transaction' do
      post_params = {
        input_amount: Faker::Commerce.price,
        input_currency: Faker::Currency.code,
        output_amount: Faker::Commerce.price,
        output_currency: Faker::Currency.code
      }
      post '/api/v1/create', params: { transaction: post_params }
      json_response = JSON.parse(response.body).deep_symbolize_keys
      expect(json_response[:success]).to eq(false)
    end
  end
end
