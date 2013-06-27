require 'uri'
require 'cgi'

module Wetube
  class Playlist
    def self.base_url
      "http://localhost:3001"
    end

    def self.find_url(id)
      "#{base_url}/playlists/#{id}.json"
    end

    def self.create_url
      "#{base_url}/videos.json"
    end

    def self.playlist_video_url(playlist_id)
      "#{base_url}/playlists/#{playlist_id}/playlist_videos.json"
    end

    def self.find(id)
      response = Server.get_resource find_url(id)
      handle_json(response)
    end

    def self.find_or_create_video(playlist_id, params)
      # parse the YouTube URL from the params and use below
      # video_id = get_video_id(params[:url])
      # params[:video_id] = video_id
      # params.delete(:url)
      response = Server.post_resource(create_url, {video: params, playlist_id: playlist_id})
      handle_json(response)
    end

    def self.get_video_id(video_url)
      params = CGI.parse(URI.parse(video_url).query)
      params["v"].first
    end

    def self.handle_json(response)
      json = JSON.parse(response)
      assign_params_from_json(json)
    end

    def self.assign_params_from_json(data)
      # trying to inject the status of the playlist video into the hashie mash
      #playlist_videos = Server.get_resource(playlist_video_url(data['id']))
      #raise playlist_videos.inspect

      Hashie::Mash.new(data)
    end

    def self.update_playlist_video_to_played(playlist_id, video_id)
      Server.put_resource("#{base_url}/playlists/#{playlist_id}/#{video_id}")
    end
  end
end