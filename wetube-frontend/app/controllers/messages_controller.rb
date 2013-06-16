class MessagesController < ApplicationController
  def create
    @message = Wetube::Conversation.create_message(
      params[:conversation_id],
      {content: params[:content],
        user_id: 1})
    # raise @message.inspect
  end
end