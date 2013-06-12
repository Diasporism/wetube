require "wetube/version"
require "json"
require "hashie"
require "rest-client"

module Wetube
  BASE_URL = "http://localhost:3000"

  class Service
    def self.get(id)
      "#{BASE_URL}/conversations/#{id}"
    end
  end

  class Conversation
    def self.fetch_conversation(id)
      RestClient.get(Service.get(id))
    end
  end
end
