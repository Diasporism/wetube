require "wetube/version"
require "json"
require "hashie"
require "rest-client"
require "wetube/conversation"
require "wetube/playlist"
require "wetube/theater"

module Wetube
  class Server
    def self.get_resource(url)
      RestClient.get url
    end

    def self.post_resource(url, params = {})
      RestClient.post url, params
    end

    def self.put_resource(url, params = {})
      RestClient.put url, params
    end
  end
end
