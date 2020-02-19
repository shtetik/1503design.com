class HomeController < ApplicationController
  def index
    @works = Work.positioned
  end

  def privacy
  end
end
