class TagsController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @tag = Tag.find(params[:id])
    @works = @tag.works
    render 'index'
  end
end
