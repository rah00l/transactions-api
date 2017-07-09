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

# POST a transaction to generate transaction
  describe 'POST /consumers/:consumer_id/transactions' do
    let(:valid_attributes) { { merchant_id: merchant_id, sale_amount: '112.34', date: '1' } }

    context 'when request is valid' do
      before { post "/consumers/#{consumer_id}/transactions", params: valid_attributes }

      it 'creates a transaction' do
        expect(json['sale_amount']).to eq('112.34')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /consumers/:consumer_id/transactions/:id' do
    let(:valid_attributes) { { sale_amount: '201.99' } }

    before { put "/consumers/#{consumer_id}/transactions/#{id}", params: valid_attributes }

    context 'when transaction exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the transaction' do
        updated_transaction = Transaction.find(id)
        expect(updated_transaction.sale_amount.to_s).to eq('201.99')
      end
    end

    context 'when transaction does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Transaction/)
      end
    end
  end
end
