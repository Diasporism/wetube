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
      Hashie::Mash.new(data)
    end
  end
end