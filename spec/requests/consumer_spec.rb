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

  describe 'POST /consumers' do
    let(:valid_attributes) { { first_name: 'Learn', last_name: 'Lashdsd' } }

    context 'when request is valid' do
      before { post '/consumers', params: valid_attributes }

      it 'creates a consumer' do
        expect(json['first_name']).to eq('Learn')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end