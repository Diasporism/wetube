class HomeController < ApplicationController
  def show
    @theaters = Theater.all
  end
end