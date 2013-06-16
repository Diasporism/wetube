class MessagesController < ApplicationController
  def create
    @message = Wetube::Conversation.create_message(params[:conversation_id], params[:message])
  end
end