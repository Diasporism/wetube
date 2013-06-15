module Wetube
  class Theater
    def self.create_conversation_url
      "#{Conversation.base_url}/conversations.json"
    end

    def self.create_playlist_url
      "#{Playlist.base_url}/playlists.json"
    end

    def self.create
      conversation, playlist = gather_theater_components

      conversation_id = JSON.parse(conversation)['id']
      playlist_id = JSON.parse(playlist)['id']

      Hashie::Mash.new(
        playlist_id: playlist_id,
        conversation_id: conversation_id)
    end

    def self.gather_theater_components
      [Server.post_resource(create_conversation_url), Server.post_resource(create_playlist_url)]
    end
  end
end