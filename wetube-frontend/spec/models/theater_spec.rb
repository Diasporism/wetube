require 'spec_helper'

describe Theater do
  it "is a valid theater" do
    theater = Theater.new(
      :name => 'james blakeness',
      :genre => 'music videos')
    theater.save
    expect(theatre).to be_valid
  end
end
