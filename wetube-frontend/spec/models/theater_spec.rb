require 'spec_helper'

describe Theater do
  before :each do
    described_class.any_instance.stub(:initialize_theater_from_gem)
    @theater = Theater.new(valid_params)
    @theater.conversation_id = 1
    @theater.playlist_id = 1
  end

  let!(:valid_params){{name: 'james blakeness', genre: 'music videos'}}

  it "is a valid theater if it has valid params" do
    @theater.save
    expect(@theater).to be_valid
    expect(@theater.conversation_id).to eq 1
  end

  it "is not valid with repeat names" do
    expect{@theater.save}.to change(Theater, :count).by(1)

    theater2 = Theater.new(valid_params)
    theater2.conversation_id = 2
    theater2.playlist_id = 2
    expect{theater2.save}.to change(Theater, :count).by(0)
  end

  it "is not valid with repeat ids" do
    expect{@theater.save}.to change(Theater, :count).by(1)

    theater2 = Theater.new(valid_params)
    theater2.name = "something else"
    theater2.conversation_id = 1
    theater2.playlist_id = 2
    expect{theater2.save}.to change(Theater, :count).by(0)
  end
end
