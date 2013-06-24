class HomeController < ApplicationController
  def show
    @theaters = Theater.all
    @playlists = Theater.all.collect {|t| Wetube::Playlist.find(t.playlist_id)}
  end
end