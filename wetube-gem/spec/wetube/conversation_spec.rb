require 'spec_helper'

describe Wetube::Conversation do

  before :each do
    response = "{\"id\":1,\"created_at\":\"2013-06-12T21:13:32Z\",\"messages\":[{\"content\":\"Hey, ASL\",\"id\":1,\"user_id\":1}]}"
    Wetube::Server.stub(:get_resource).and_return(response)
  end
  describe ".find" do
    it "returns a hashie of found conversation" do      
      result = described_class.find(1)
      expect(result.id).to eq 1
      expect(result.created_at).to eq '2013-06-12T21:13:32Z'
    end
    it "returns all messages belonging to the conversation" do
      result = described_class.find(1)
      expect(result.messages.first.content).to eq 'Hey, ASL'
    end
  end
end