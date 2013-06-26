class PlaylistsController < ApplicationController
  respond_to :json

  def show
    @playlist = Playlist.find(params[:id])
    respond_with @playlist
  end

  def create
    @playlist = Playlist.create
    respond_with @playlist
  end

  def update
    @playlist_video = PlaylistVideo.where(video_id: params[:video_id], playlist_id: params[:playlist_id]).first
    @playlist_video.update_attributes(status: 'played')
    respond_with @playlist_video
  end
end
