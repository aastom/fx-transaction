# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Transactions Requests', type: :request do
  describe 'GET /api/v1/transactions' do
    it 'returns a list of transactions' do
      get api_v1_transactions_path
      expect(response).to have_http_status(:ok)
    end
  end
end
