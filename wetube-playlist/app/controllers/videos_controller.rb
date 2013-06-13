class VideosController < ApplicationController
  respond_to :json

  def create
    @video = Video.find_or_create_by_url(params[:video][:url])
    @video.update_attributes(params[:video])

    if @video.valid?
      @video.add_to_playlist(params[:playlist_id])
    end

    if @video.save
      render json: @video.to_json
    else
      render json: @video.errors.to_json
    end
  end
end
