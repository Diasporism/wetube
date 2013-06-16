class MessagesController < ApplicationController
  def create
    @message = Wetube::Conversation.create_message(
      params[:conversation_id],
      {content: params[:content],
        user_id: 1}) # Obviously make this the actual user id when we build user table
  end
end