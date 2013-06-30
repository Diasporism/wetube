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
    playlist_video = PlaylistVideo.where(id: params[:id]).first
    playlist_video.update_attributes(status: 'played')
    respond_with @playlist_video
  end

  def playlist_videos
    playlist = Playlist.where(id: params[:playlist_id]).first
    @playlist_videos = playlist.playlist_videos
    respond_with @playlist_videos
  end
end
