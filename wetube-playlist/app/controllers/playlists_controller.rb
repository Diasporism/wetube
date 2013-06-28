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
    playlist_id    = Playlist.where(id: params[:playlist_id]).first.id
    video_id       = Video.where(video_id: params[:video_id]).first.id
    playlist_video = PlaylistVideo.where(video_id: video_id, playlist_id: playlist_id, status: 'queued').first
    
    playlist_video.update_attributes(status: 'played')
    respond_with @playlist_video
  end

  def playlist_videos
    playlist = Playlist.where(id: params[:playlist_id]).first
    @playlist_videos = playlist.playlist_videos
    respond_with @playlist_videos
  end
end
