class HomeController < ApplicationController
  def index
    @works = Work.positioned
  end
end
