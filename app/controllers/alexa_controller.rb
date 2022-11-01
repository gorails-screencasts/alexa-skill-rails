class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    handler = "#{intent}Handler".constantize rescue DefaultHandler
    render json: handler.new(params).call
  end

  def intent
    params.dig(:request, :intent, :name) || "Default"
  end
end
