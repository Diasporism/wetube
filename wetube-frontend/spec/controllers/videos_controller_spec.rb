require 'spec_helper'

describe VideosController do
  describe 'POST create' do
    let(:meta){
      { "title"=>"Glenn Morrison - Contact",
        "duration"=>403,
        "thumbnail"=>"http://i1.ytimg.com/vi/GHIGiTZyxt4/default.jpg" }
    }

    it 'assigns the meta as the correct video metadata' do
      theater = Theater.create(name: "something", genre: "something")
      post :create, url: "http://www.youtube.com/watch?v=GHIGiTZyxt4", playlist_id: theater.playlist_id, format: :js
      expect(assigns(:meta)).to eq meta
    end
  end
end