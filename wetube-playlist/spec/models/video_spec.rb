require 'spec_helper'

describe Video do
  let(:video){
    Video.create(video_id: "Ys7-6_t7OEQ", title: "Some title")
  }

  it "is not valid without a video" do
    expect{ video.video_id = nil }.to change{ video.valid? }.to false
  end

  it "is not valid without a title" do
    expect{ video.title = nil }.to change{ video.valid? }.to false
  end

  describe ".add_to_playlist" do
    it "adds a video to the list of playlist videos" do
      playlist = Playlist.create
      video.add_to_playlist(playlist.id)
      expect(playlist.videos).to include(video)
    end
  end
end
