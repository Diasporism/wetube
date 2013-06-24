class HomeController < ApplicationController
  def show
    @theaters = Theater.all
    # @playlists = seed_playlists
  end
end