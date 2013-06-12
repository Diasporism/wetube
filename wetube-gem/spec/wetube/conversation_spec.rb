require 'spec_helper'

describe Wetube::Conversation do
  describe ".find" do
    xit "returns a hashie of found conversation" do
      VCR.use_cassette('found_conversation') do
        result = described_class.find(1)
        expect(result.id).to eq 1
        # This will fail. There is no conversation with id 1
      end
    end
  end
end