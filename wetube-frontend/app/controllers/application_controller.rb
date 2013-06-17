class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :broadcast

  def broadcast(channel, &block)
    message = {channel: channel, data: capture(&block)}
    uri = URI.parse('http://localhost:9292/faye')
    Net::HTTP.post_form(uri, message: message.to_json)
  end
end
