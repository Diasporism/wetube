require 'spec_helper'

describe HomeController do
  describe "GET show" do
    it "displays the home page" do
      get :show
      expect(response.status).to eq 200
    end
  end
end