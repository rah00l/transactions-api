class MerchantsController < ApplicationController
  before_action :set_merchant, only: [:update]
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
    @merchant.update(merchant_params)
    head :no_content
  end

  private

  def merchant_params
    # whitelist params
      params.permit(:name, :domain)
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end
end
