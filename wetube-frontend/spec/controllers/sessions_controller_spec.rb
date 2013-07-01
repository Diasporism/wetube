require 'spec_helper'

describe SessionsController do
  
  before :each do
    theater_stub
  end

  def theater_stub
    Theater.any_instance.stub(:initialize_theater_from_gem)
    @theater = Theater.new(name: "James Blakeness' Essential 01", genre: 'music videos')
    @theater.conversation_id = 1
    @theater.playlist_id = 1
    Wetube::Conversation.stub(find: Hashie::Mash.new(messages: []))
    Wetube::Playlist.stub(find: Hashie::Mash.new(videos: []))
    @theater.save
  end


  describe 'Sessions#create' do
    it 'begins a session with a username' do
      post :create
      expect(response).to redirect_to theater_path
    end
  end
end