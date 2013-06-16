require 'spec_helper'

describe TheatersController do
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
  end
end