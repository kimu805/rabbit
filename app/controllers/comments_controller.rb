class CommentsController < ApplicationController
  before_action :set_project
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      @created_at = l(@comment.created_at)
      CommentChannel.broadcast_to @project, { comment: @comment, user: @comment.user, created_at: @created_at }
    else
      redirect_to @project, alert: "このコメントは投稿できません"
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
