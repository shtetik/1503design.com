class TagsController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @works = Tag.find(params[:id]).works
    render 'index'
  end
end
