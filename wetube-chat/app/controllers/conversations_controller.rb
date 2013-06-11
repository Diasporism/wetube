class ConversationsController < ApplicationController
  respond_to :json

  def show
    @conversation = Conversation.find(params[:id])
    respond_with @conversation
  end
end
