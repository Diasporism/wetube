require 'cgi'
require 'uri'

class Video
  def self.parse_youtube(url)
    CGI.parse(URI.parse(url).query)["v"].first
  end

  def self.fetch_metadata(video_id)
    response = RestClient.get "http://gdata.youtube.com/feeds/api/videos/#{video_id}?v=2&alt=json"
    parsed   = JSON.parse(response)
    { title:      parsed["entry"]["title"]["$t"],
      duration:   parsed["entry"]["media$group"]["media$content"].first["duration"],
      thumbnail:  parsed["entry"]["media$group"]["media$thumbnail"].first["url"] }
  end
end