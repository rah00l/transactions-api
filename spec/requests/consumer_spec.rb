require 'rails_helper'

RSpec.describe 'Consumer', type: :request do
  # initialize test data
  let!(:consumer) { create_list(:consumer, 10) }
  let(:id) { consumer.first.id }

  # Test suite for GET /consumers
  describe 'GET /consumers' do
    before { get '/consumers' }

    it 'returns consumers' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end