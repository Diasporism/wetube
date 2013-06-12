module Wetube
  class Conversation
    def self.url(id)
      "#{BASE_URL}/conversations/#{id}.json"
    end

    def self.find(id)
      response = Server.get_resource url(id)
      handle_json response
    end

    def self.handle_json(response)
      json = JSON.parse response
      assign_params_from_json(json)
    end

    def self.assign_params_from_json(data)
      conversation = Hashie::Mash.new

      conversation.id         = data['id'].to_i
      conversation.created_at = data['created_at']
      # conversation.messages = do something with data['messages']

      conversation
    end
  end
end