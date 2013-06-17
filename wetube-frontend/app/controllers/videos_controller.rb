class VideosController < ApplicationController
  def create
    @video = Wetube::Playlist.find_or_create_video(
      params[:playlist_id],
      { url: params[:url],
        title: params[:url]
      })
  end
end