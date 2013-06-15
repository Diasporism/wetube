require 'spec_helper'

describe ConversationsController do
  describe "GET show" do
    let(:conversation) do
      Conversation.create
    end

    it "assigns the correct conversation" do
      get :show, id: conversation.id, format: :json
      expect(response.body).to eq conversation.to_json
    end

    it "returns a conversation filled with messages" do
      message_1 = conversation.messages.create(content: "My little message", user_id: 1)
      message_2 = conversation.messages.create(content: "Tacos plz", user_id: 3)
      get :show, id: conversation.id, format: :json
      json = JSON.parse(response.body)
      expect(json['messages'].count).to eq(2)
    end
  end

  describe "POST create" do
    it "creates a new conversation" do
      expect{
        post :create, format: :json
      }.to change(Conversation, :count).by(1)
    end
  end
end
