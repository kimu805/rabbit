class LikesController < ApplicationController
  before_action :set_project

  def create
    like = current_user.likes.build(project_id: @project.id)
    like.save
    render partial: "likes/like", locals: { project: @project }
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, project_id: @project.id)
    like.destroy
    render partial: "likes/like", locals: { project: @project }
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
end
