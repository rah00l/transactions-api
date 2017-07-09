RSpec.describe 'Transactions API' do
  let!(:consumer) { create(:consumer) }
  let!(:merchant) { create(:merchant) }

  let(:consumer_id) { consumer.id }
  let(:merchant_id) { merchant.id }

  let!(:transaction) { create(:transaction, consumer_id: consumer.id, merchant_id: merchant.id) }
  let(:id) { transaction.id }

# GET all transactions for a specific consumer
  describe 'GET /consumers/:consumer_id/transactions' do
    before { get "/consumers/#{consumer_id}/transactions" }

    context 'when transactions exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all transactions for a specific consumer' do
        expect(json.size).to eq(1)
      end
    end

    context 'when transactions does not exist for a given merchant' do
      let(:consumer_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Consumer/)
      end
    end
  end

# GET all transactions for a specific merchant
  describe 'GET /merchants/:merchant_id/transactions' do
    before { get "/merchants/#{merchant_id}/transactions" }

    context 'when transactions exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all transactions for a specific merchant' do
        expect(json.size).to eq(1)
      end
    end

    context 'when transactions does not exist for a given merchant' do
      let(:merchant_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Merchant/)
      end
    end
  end
end
