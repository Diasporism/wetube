class VideosController < ApplicationController
  def create
    video_id    = Video.parse_youtube(params[:url])
    @meta        = Video.fetch_metadata(video_id)
    @theater_id = Theater.find_by_playlist_id(params[:playlist_id]).id
    @video      = Wetube::Playlist.find_or_create_video(
      params[:playlist_id],
      { video_id:  video_id,
        title:     @meta[:title],
        thumbnail: @meta[:thumbnail],
        duration:  @meta[:duration]
      })
  end

  def play
    @theater_id = params[:id]
  end

  def pause
    @theater_id = params[:id]
  end

  def sync
    @theater_id = params[:id]
    @video_id = params[:video_id]
    @time = params[:time]
    @sync = params[:sync]
  end
end