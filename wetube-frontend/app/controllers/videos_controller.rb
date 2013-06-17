class VideosController < ApplicationController
  def create
    @theater_id = Theater.find_by_playlist_id(params[:playlist_id]).id
    @video = Wetube::Playlist.find_or_create_video(
      params[:playlist_id],
      { url: params[:url],
        title: params[:url]
      })
  end
end