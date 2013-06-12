require "wetube_gem/version"
require "json"
require "hashie"
require "rest-client"

module WetubeGem
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
