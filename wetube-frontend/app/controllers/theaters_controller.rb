class TheatersController < ApplicationController
  def show
    @theater = Theater.find_by_slug(params[:id])

    @conversation = Wetube::Conversation.find(@theater.conversation_id)
    @playlist = Wetube::Playlist.find(@theater.playlist_id)
  end
end