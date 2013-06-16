require 'spec_helper'

describe MessagesController do
  describe "POST create" do
    xit "post creates message with valid params" do
      VCR.use_cassette('create_message') do
        # post :create, conversation_id: 1, content: "Hello, world!"
        # expect(response.status).to eq 200 
      end
    end
  end
end