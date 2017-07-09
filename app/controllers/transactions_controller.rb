class TransactionsController < ApplicationController
  before_action :get_transactable, only: [:index]
  # GET /consumers/:consumer_id/transactions
  # GET /merchants/:merchant_id/transactions
  def index
    json_response(@transactable.transactions)
  end

  # POST /consumers/:consumer_id/transactions
  # POST /merchants/:merchant_id/transactions
  def create
    @transaction = Transaction.create!(transaction_params)
    json_response(@transaction, :created)
  end

  # PUT /merchants/:id
  def update
  end

  private

  def get_transactable
    @transactable = if params[:consumer_id].present?
      Consumer.find(params[:consumer_id])
    else
      Merchant.find(params[:merchant_id])
    end
  end

  def transaction_params
    params.permit(:consumer_id, :merchant_id, :sale_amount, :date)
  end

end
