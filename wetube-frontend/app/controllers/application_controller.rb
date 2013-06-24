class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :seeded_playlists

  def seeded_playlists
    [ 
      { image: "home-filler.jpg",
        slug: "james-blakes-greatest-hits",
        gif: "gif-filler.jpg"},
      { image: "home-filler.jpg",
        slug: "james-blakes-b-sides",
        gif: "gif-filler.jpg"},
      { image: "home-filler.jpg",
        slug: "james-blakes-eponymous-first-try",
        gif: "gif-filler.jpg"},
      { image: "home-filler.jpg",
        slug: "music-from-james-blakes-eps",
        gif: "gif-filler.jpg"},
      { image: "home-filler.jpg",
        slug: "james-blakes-djing-prowess",
        gif: "gif-filler.jpg"}
    ]
  end

end
