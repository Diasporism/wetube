class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :seeded_playlists
  after_filter :set_access_control_headers

  def seeded_playlists
    [ 
      { image: "blake.jpg",
        slug: "james-blake-videos",
        gif: "http://s3.amazonaws.com/wetube/blake.gif"},
      { image: "goat.jpg",
        slug: "hilarious-animals",
        gif: "http://s3.amazonaws.com/wetube/goat.gif"},
      { image: "dunk.jpg",
        slug: "top-plays-of-2013",
        gif: "http://s3.amazonaws.com/wetube/dunk.gif"}
    ]
  end

  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

end
