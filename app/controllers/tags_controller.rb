class TagsController < ApplicationController
  def index
    @works = Work.have_pages
  end

  def show
    @tag = Tag.find(params[:id])
    @works = @tag.works
    render 'index'
  end
end
