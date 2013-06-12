require 'spec_helper'

describe Message do
  let(:message){
    Message.new(content: "Something", user_id: 1)
  }

  it "is not valid without content" do
    expect{ message.content = nil }.to change{ message.valid? }.to false
  end

  it "is not valid if content is empty" do
    expect{ message.content = "" }.to change{ message.valid? }.to false
  end

  it "is not valid without a user id" do
    expect{ message.user_id = nil }.to change{ message.valid? }.to false
  end
end
