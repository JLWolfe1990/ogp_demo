class HomeController < ApplicationController
  def welcome
    @ogp = Ogp.new
  end
end