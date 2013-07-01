class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :seeded_playlists
  after_filter :set_access_control_headers

  def seeded_playlists
    [ 
      { image: "blake.jpg",
        slug: "james-blake-videos",
        gif: "blake.gif"},
      { image: "goat.jpg",
        slug: "hilarious-animals",
        gif: "goat.gif"},
      { image: "dunk.jpg",
        slug: "top-plays-of-2013",
        gif: "dunk.gif"},
      # { image: "home-filler.jpg",
      #   slug: "music-from-james-blakes-eps",
      #   gif: "gif-filler.gif"},
      # { image: "home-filler.jpg",
      #   slug: "james-blakes-djing-prowess",
      #   gif: "gif-filler.gif"}
    ]
  end

  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

end
