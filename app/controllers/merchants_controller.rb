class MerchantsController < ApplicationController
    # GET /merchants
  def index
    @merchants = Merchant.all
    json_response(@merchants)
  end

  # POST /merchants
  def create
  end

  # PUT /merchants/:id
  def update
  end
end
