class TransactionsController < ApplicationController
  before_action :get_transactable, only: [:index]
  before_action :set_transaction, only: [:update]
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

  # PUT /consumers/:consumer_id/transactions/:id
  # PUT /merchants/:merchant_id/transactions/:id
  def update
    @transaction.update(transaction_params)
    head :no_content
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

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end
