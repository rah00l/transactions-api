class ConsumersController < ApplicationController
  # GET /consumers
  def index
    @consumers = Consumer.all
    json_response(@consumers)
  end

  # POST /consumers
  def create
  end

  # PUT /consumers/:id
  def update
  end
end
