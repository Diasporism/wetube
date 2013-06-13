class PlaylistsController < ApplicationController
  respond_to :json

  def show
    @playlist = Playlist.find(params[:id])
    respond_with @playlist
  end
end
