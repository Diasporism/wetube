require 'spec_helper'

describe TheatersController do
  render_views

  describe "GET show" do

    before :each do
      Theater.any_instance.stub(:initialize_theater_from_gem)
      @theater = Theater.new(valid_params)
      @theater.conversation_id = 1
      @theater.playlist_id = 1
      @theater.save
    end

    let!(:valid_params){{name: "James Blakeness' Essential 01", genre: 'music videos'}}

    it "response is 200 on created theater" do
      VCR.use_cassette('200_theater') do
        get :show, id: @theater.slug
        expect(response.status).to eq 200
      end
    end

    context "when a theater has videos in it's playlist" do
      before :each do
        Wetube::Playlist.should_receive(:find).with(1).and_return(double("playlist", id: 1, videos: [stub_video(1),stub_video(2),stub_video(3)]))
      end

      it "embeds the playlist in a javascript tag" do
        VCR.use_cassette('theater_playlist_embed') do
          get :show, id: @theater.slug
          expect(response.status).to eq 200
          expect(response).to have_selector('script') { |script_tag| script_tag.should contain(/.*\[1,2,3\].*/)}
        end
      end

    end
  end
end

def stub_video(video_id)
  Hashie::Mash.new(title: 'James Blake Something', video_id: video_id)
end