class CommentsController < ApplicationController
  before_action :set_project
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @project, notice: "コメントを投稿しました"
    else
      render "projects/show", alert: "このコメントは投稿できません"
    end
  end

  def destroy
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to @project, notice: "コメントを削除しました"
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(project_id: @project.id)
  end
end
