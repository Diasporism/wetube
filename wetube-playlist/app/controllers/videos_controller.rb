class VideosController < ApplicationController
  respond_to :json

  def create
    @video = Video.find_or_create_by_video_id(params[:video][:video_id])
    @video.update_attributes(params[:video])

    if @video.save
      @video.add_to_playlist(params[:playlist_id])
      render json: @video.to_json
    else
      render json: @video.errors.to_json
    end
  end
end
