class Admin::WorksController < Admin::ApplicationController
  before_action :set_work, only: [:edit, :update, :destroy]

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = 'Work successfully created'
      redirect_to edit_admin_work_path(@work)
    else
      flash.now.alert = 'Could not create Work'
      render :new
    end
  end

  def edit
    @images = @work.positionable_sample_images
  end

  def update
    if @work.update(work_params)
      flash[:success] = 'Work successfully updated'
      redirect_to edit_admin_work_path(@work)
    else
      flash[:error] = 'Failed to update work'
      render :edit
    end
  end

  def destroy
    @work.destroy
    redirect_to admin_works_path
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def work_params
    params.require(:work).permit(
      :name,
      :caption,
      :text,
      :link,
      :year,
      :image_positions,
      :position,
      :has_page,
      :has_client,
      :meta_description,
      tag_ids:[],
      images_attributes: [
        :id,
        :work_id,
        :img,
        :kind,
        :half,
        :_destroy
      ]
    )
  end
end
