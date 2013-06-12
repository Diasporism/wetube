require "wetube/version"
require "json"
require "hashie"
require "rest-client"
require "wetube/conversation"

module Wetube
  BASE_URL = "http://localhost:3000"

  class Server
    def self.get_resource(url)
      RestClient.get url
    end
  end
end
