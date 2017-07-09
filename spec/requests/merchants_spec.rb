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

  describe 'POST /merchants' do
    let(:valid_attributes) { { name: 'Learn', domain: 'Lashdsd' } }

    context 'when request is valid' do
      before { post '/merchants', params: valid_attributes }

      it 'creates a merchant' do
        expect(json['name']).to eq('Learn')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /merchants/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    before { put "/merchants/#{id}", params: valid_attributes }

    context 'when the record exists' do
      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'updates the record with first name field' do
        updated_merchant = Merchant.find(id)
        expect(updated_merchant.name).to eq('Shopping')
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end
