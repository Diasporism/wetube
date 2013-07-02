class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :seeded_playlists
  after_filter :set_access_control_headers

  S3_BUCKET = "http://s3.amazonaws.com/wetube"

  def seeded_playlists
    [ 
      { image: "#{S3_BUCKET}/blake.jpg",
        slug: "james-blake-videos",
        gif: "#{S3_BUCKET}/blake.gif"},
      { image: "#{S3_BUCKET}/goat.jpg",
        slug: "hilarious-animals",
        gif: "#{S3_BUCKET}/goat.gif"},
      { image: "#{S3_BUCKET}/dunk.jpg",
        slug: "top-plays-of-2013",
        gif: "#{S3_BUCKET}/dunk.gif"}
    ]
  end

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

end
