class MessagesController < ApplicationController
  respond_to :json

  def create
    @theater_id = Theater.find_by_conversation_id(params[:conversation_id]).id
    @message = Wetube::Conversation.create_message(params[:conversation_id], {content: params[:content], user_id: 1, name: params[:name]})
  end

  def name
    session[:name] = params[:name]
    render json: session[:name].to_json
  end
end