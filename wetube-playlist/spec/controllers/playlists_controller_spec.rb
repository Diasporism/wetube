require 'spec_helper'

describe PlaylistsController do
  let!(:playlist) do
    Playlist.create
  end

  describe "GET show" do
    it "assigns the correct playlist" do
      get :show, id: playlist.id, format: :json
      expect(response.body).to eq playlist.to_json
    end

    it "returns a playlist filled with videos" do
      video_1 = playlist.videos.create(video_id: "something", title: "Something", thumbnail: "something", duration: 405)
      video_2 = playlist.videos.create(video_id: "something_else", title: "Something else", thumbnail: "something", duration: 405)
      get :show, id: playlist.id, format: :json
      json = JSON.parse(response.body)
      expect(json['videos'].count).to eq(2)
    end
  end

  describe "POST create" do
    it "creates a playlist" do
      expect{
        post :create, format: :json
      }.to change(Playlist, :count).by(1)
    end
  end

  describe "UPDATE playlist_video" do
    it "updates a playlist video's status to 'played'" do
      playlist.videos.create(video_id: "something", title: "Something", thumbnail: "something", duration: 405)
      playlist.videos.create(video_id: "something_else", title: "Something else", thumbnail: "something", duration: 405)
      
      get :update, format: :json, id: 1

      expect(playlist.playlist_videos.first.status).to eq 'played'
      expect(playlist.playlist_videos.last.status).to eq 'queued'
    end
  end
end