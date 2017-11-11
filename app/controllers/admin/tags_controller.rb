class Admin::TagsController < Admin::ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = 'Tag successfully created'
      redirect_to admin_tags_path
    else
      flash.now.alert = 'Could not create Tag'
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = 'Tag successfully updated'
      redirect_to admin_tags_path
    else
      flash[:error] = 'Failed to update Tag'
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path
  end


  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(
      :name
    )
  end
end
