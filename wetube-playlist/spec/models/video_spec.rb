require 'spec_helper'

describe Video do
  let(:video){
    Video.new(url: "http://www.youtube.com/watch?v=Ys7-6_t7OEQ", title: "Some title")
  }

  it "is not valid without a video" do
    expect{ video.url = nil }.to change{ video.valid? }.to false
  end

  it "is not valid without a title" do
    expect{ video.title = nil }.to change{ video.valid? }.to false
  end
end
