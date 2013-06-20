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
end