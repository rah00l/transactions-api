require 'rails_helper'

RSpec.describe 'Merchant', type: :request do
  # initialize test data
  let!(:merchant) { create_list(:merchant, 10) }
  let(:id) { merchant.first.id }

  # Test suite for GET /merchants
  describe 'GET /merchants' do
    before { get '/merchants' }

    it 'returns merchants' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end