class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :seed_playlists

  def seed_playlists
    {
      "james-blakes-greatest-hits" => "home-filler.jpg",
      "james-blakes-b-sides" => "home-filler.jpg",
      "james-blakes-eponymous-first-try" => "home-filler.jpg",
      "music-from-james-blakes-eps" => "home-filler.jpg",
      "james-blakes-djing-prowess" => "home-filler.jpg"
    }
  end

end
