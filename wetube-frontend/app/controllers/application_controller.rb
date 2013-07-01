class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :seeded_playlists
  after_filter :set_access_control_headers

  def seeded_playlists
    [ 
      { image: "home-filler.jpg",
        slug: "james-blakes-greatest-hits",
        gif: "gif-filler.gif"},
      { image: "home-filler.jpg",
        slug: "james-blakes-b-sides",
        gif: "gif-filler.gif"},
      { image: "home-filler.jpg",
        slug: "james-blakes-eponymous-first-try",
        gif: "gif-filler.gif"},
      { image: "home-filler.jpg",
        slug: "music-from-james-blakes-eps",
        gif: "gif-filler.gif"},
      { image: "home-filler.jpg",
        slug: "james-blakes-djing-prowess",
        gif: "gif-filler.gif"}
    ]
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
  end
end
