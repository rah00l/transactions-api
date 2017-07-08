class ConsumersController < ApplicationController
    before_action :set_consumer, only: [:update]
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
    @consumer.update(consumer_params)
    head :no_content
  end

  private

  def consumer_params
  # whitelist params
    params.permit(:first_name, :last_name)
  end

  def set_consumer
    @consumer = Consumer.find(params[:id])
  end
end
