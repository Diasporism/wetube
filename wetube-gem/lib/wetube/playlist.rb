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
      assign_video_status_from_playlist(JSON.parse(response))
    end

    def self.find_or_create_video(playlist_id, params)
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
      Hashie::Mash.new(data)
    end

    def self.assign_video_status_from_playlist(data)
      response = Server.get_resource(playlist_video_url(data['id']))
      playlist_videos = JSON.parse(response)
      statuses = playlist_videos.collect { |s| s['status'] }

      data['videos'].each_with_index { |v, i| v['status'] = statuses[i] }
      assign_params_from_json(data)
    end
  end
end