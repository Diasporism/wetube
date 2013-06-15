require 'spec_helper'

describe VideosController do
  describe "POST create" do
    let!(:valid_params){
      { url: "http://www.youtube.com/watch?v=Ys7-6_t7OEQ",
        title: "J Beebs"}
    }

    let!(:playlist){Playlist.create}

    it "assigns video as video" do
      post :create, video:  valid_params, format: :json, playlist_id: playlist.id
      expect(assigns(:video)).to be_kind_of Video
    end

    it "only creates one video if posted multiple times" do
      expect{
        post :create, video: valid_params, format: :json, playlist_id: playlist.id 
      }.to change(Video, :count).by 1
      expect{
        post :create, video: valid_params, format: :json, playlist_id: playlist.id 
      }.to change(Video, :count).by 0
    end

    it "returns errors if video has invalid params" do
      post :create, video:  {url: "  ", title: "J Beebs"}, format: :json, playlist_id: playlist.id 
      expect(response.body).to include("be blank")
    end
  end
end