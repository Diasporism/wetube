module Wetube
  class Conversation
    def self.base_url
      "http://localhost:3000"
    end

    def self.find_url(id)
      "#{base_url}/conversations/#{id}.json"
    end

    def self.create_url(conversation_id)
      "#{base_url}/conversations/#{conversation_id}/messages.json"
    end

    def self.find(id)
      response = Server.get_resource find_url(id)
      handle_json response
    end

    def self.create_message(conversation_id, params)
      response = Server.post_resource(create_url(conversation_id), {message: params})
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