require 'spec_helper'

describe Wetube::Theater do
  describe ".create" do
    # before :each do
    #   created_components = ["{\"id\":2}", "{\"id\":1}"]
    #   Wetube::Theater.stub(:gather_theater_components).and_return(created_components)
    # end

    it "should create a conversation" do
      result = described_class.create
      expect(result.conversation_id).to eq 2
      expect(result.playlist_id).to eq 1
    end
  end
end