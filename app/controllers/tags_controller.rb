class TagsController < ApplicationController
  before_action :set_gon_tag

  def index
    @works = Work.all
  end

  def show
    @works = Tag.find(params[:id]).works
    render 'index'
  end

  private

  def set_gon_tag
    gon.tag = params[:id]
  end
end
