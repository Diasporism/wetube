require 'spec_helper'

describe Conversation do
  describe "#messages" do
    it "returns a list of message objects" do
      conversation = Conversation.create
      message_1 = conversation.messages.create(content: "My little message", user_id: 1)
      message_2 = conversation.messages.create(content: "Tacos plz", user_id: 3)
      expect(conversation.messages).to eq [message_1, message_2]
    end
  end
end
