class MessagesController < ApplicationController
  respond_to :json

  def create
    conversation = Conversation.find(params[:conversation_id])
    @message = conversation.messages.new(params[:message])

    if @message.save
      render json: @message.to_json
    else
      render json: @message.errors.to_json
    end
  end
end