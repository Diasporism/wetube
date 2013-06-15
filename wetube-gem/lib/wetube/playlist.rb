module Wetube
  class Playlist
    def self.playlist_url
      "http://localhost:3001"
    end

    def self.find_url(id)
      "#{playlist_url}/playlists/#{id}.json"
    end

    def self.create_url
      "#{playlist_url}/videos.json"
    end

    def self.find(id)
      response = Server.get_resource find_url(id)
      handle_json response
    end

    def self.find_or_create_video(playlist_id, params)
      response = Server.post_resource(create_url, {video: params, playlist_id: playlist_id})
      handle_json response
    end

    def self.handle_json(response)
      json = JSON.parse response
      assign_params_from_json(json)
    end

    def self.assign_params_from_json(data)
      Hashie::Mash.new(data)
    end
  end
end