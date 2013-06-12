require 'spec_helper'

describe MessagesController do
  describe "POST create" do
    let!(:conversation){Conversation.create}

    context "given valid parameters" do
      let(:valid_params) do
        { content: "This is my message",
          user_id: 1 }
      end

      it "creates a new message" do
        post :create, message: valid_params, format: :json, conversation_id: conversation.id
        message = JSON.parse(response.body)
        expect(message["content"]).to eq 'This is my message'
      end
    end

    context "given invalid parameters" do
      it "creates a new message" do
        post :create, format: :json, conversation_id: conversation.id
        expect(response.body).to include 'be blank'
      end           
    end
  end
end