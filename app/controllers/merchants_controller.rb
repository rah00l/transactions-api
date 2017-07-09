class MerchantsController < ApplicationController
    # GET /merchants
  def index
    @merchants = Merchant.all
    json_response(@merchants)
  end

  # POST /merchants
  def create
    @merchant = Merchant.create!(merchant_params)
    json_response(@merchant, :created)
  end

  # PUT /merchants/:id
  def update
  end

  private

  def merchant_params
    # whitelist params
      params.permit(:name, :domain)
  end
end
