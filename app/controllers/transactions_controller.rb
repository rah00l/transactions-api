class TransactionsController < ApplicationController
  before_action :get_transactable, only: [:index]
  # GET /consumers/:consumer_id/transactions
  # GET /merchants/:merchant_id/transactions
  def index
    json_response(@transactable.transactions)
  end

  # POST /merchants
  def create
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
end
