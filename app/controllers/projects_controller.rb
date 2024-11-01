class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def new
    @project_tag = ProjectTag.new
  end

  def create
    @project_tag = ProjectTag.new(project_tag_params)
    binding.pry
    if @project_tag.valid?
      @project_tag.save
      redirect_to project_path(@project_tag.project.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    project_attributes = @project.attributes
    @project_tag = ProjectTag.new(project_attributes)
  end

  def update
    if @project_tag.update(project_params)
      redirect_to project_path(@project_tag)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @project_tag.destroy
  end

  private
  def project_tag_params
    params.require(:project_tag).permit(:title, :description, :display).merge(user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
