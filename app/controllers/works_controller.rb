class WorksController < ApplicationController
  def show
    @work = Work.find(params[:id])
    @images = @work.positionable_sample_images
  end
end
