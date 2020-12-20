class HomeController < ApplicationController
  def index
    @url_mapping = UrlMapping.new
  end
end
