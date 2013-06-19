require 'spec_helper'

describe PlaylistsController do
  describe "GET show" do
    let!(:playlist) do
      Playlist.create
    end

    it "assigns the correct playlist" do
      get :show, id: playlist.id, format: :json
      expect(response.body).to eq playlist.to_json
    end

    it "returns a playlist filled with videos" do
      video_1 = playlist.videos.create(video_id: "something", title: "Something", thumbnail: "something")
      video_2 = playlist.videos.create(video_id: "something_else", title: "Something else", thumbnail: "something")
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
end