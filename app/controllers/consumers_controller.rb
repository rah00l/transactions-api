class ConsumersController < ApplicationController
  # GET /consumers
  def index
    @consumers = Consumer.all
    json_response(@consumers)
  end

  # POST /consumers
  def create
    @consumer = Consumer.create!(consumer_params)
    json_response(@consumer, :created)
  end

  # PUT /consumers/:id
  def update
  end

  private

  def consumer_params
  # whitelist params
    params.permit(:first_name, :last_name)
  end

end
