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
      video_1 = playlist.videos.create(url: "http://www.youtube.com/something", title: "Something")
      video_2 = playlist.videos.create(url: "http://www.youtube.com/something_else", title: "Something else")
      get :show, id: playlist.id, format: :json
      json = JSON.parse(response.body)
      expect(json['videos'].count).to eq(2)
    end
  end
end