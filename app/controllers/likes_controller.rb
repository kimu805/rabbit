class LikesController < ApplicationController
  before_action :set_project

  def create
    like = current_user.likes.build(project_id: @project.id)
    like.save
    redirect_to @project
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, project_id: @project.id)
    like.destroy
    redirect_to @project
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
end
