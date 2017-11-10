class Admin::WorksController < Admin::ApplicationController
  before_action :set_work, only: [:edit, :update]

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
      redirect_to admin_works_path
    else
      flash.now.alert = 'Could not create Work'
      render :new
    end
  end

  def edit;end

  def update
    if @work.update(work_params)
      flash[:success] = 'Work successfully updated'
      redirect_to admin_works_path
    else
      flash[:error] = 'Failed to update work'
      render :edit
    end
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
      tag_ids:[]
    )
  end
end
