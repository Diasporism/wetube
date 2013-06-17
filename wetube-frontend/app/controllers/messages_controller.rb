class MessagesController < ApplicationController
  def create
    @theater_id = Theater.find_by_conversation_id(params[:conversation_id]).id
    @message = Wetube::Conversation.create_message(
      params[:conversation_id],
      {content: params[:content],
        user_id: 1}) # Obviously make this the actual user id when we build user table
  end
end