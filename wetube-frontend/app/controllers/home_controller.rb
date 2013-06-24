class HomeController < ApplicationController
  def show
    @theaters = Theater.all
    @playlists = seeded_playlists
  end
end