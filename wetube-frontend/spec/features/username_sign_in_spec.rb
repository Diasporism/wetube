require 'spec_helper'

describe 'user inputs a username to begin a session' do

    before :each do
      valid_params = {name: 'james-blakes-greatest-hits'}
      Theater.any_instance.stub(:initialize_theater_from_gem)
      @theater = Theater.create(valid_params)
      @theater.conversation_id = 1
      @theater.playlist_id = 1
      Wetube::Conversation.stub(find: Hashie::Mash.new(messages: []))
      Wetube::Playlist.stub(find: Hashie::Mash.new(videos: []))
      @theater.save
    end

  it 'requires you to sign in with a username before entering a theater' do
    
    ApplicationController.stub(:seeded_playlists).and_return([ 
      { image: "home-filler.jpg",
        slug: "james-blakes-greatest-hits",
        gif: "gif-filler.gif"}])
    visit root_path
    click_link('Home-filler', href: theater_path('james-blakes-greatest-hits'))
    # page.should have_content('Please create a screen name')
  end
end