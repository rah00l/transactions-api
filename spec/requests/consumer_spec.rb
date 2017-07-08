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

  describe 'PUT /consumers/:id' do
    let(:valid_attributes) { { first_name: 'Shopping' } }

    before { put "/consumers/#{id}", params: valid_attributes }

    context 'when the record exists' do
      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'updates the record with first name field' do
        updated_consumer = Consumer.find(id)
        expect(updated_consumer.first_name).to eq('Shopping')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
