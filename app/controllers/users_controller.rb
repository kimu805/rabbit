class UsersController < ApplicationController
  before_action :only_myself, except: [:show, :follow_list]
  before_action :set_user, only: [:show, :follow_list]

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: "「#{current_user.nickname}」を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    if params[:project] && params[:tag]
      @project = @user.projects.find(params[:project])
      @tag = @project.tags.find(params[:tag]) 
    end

    if current_user == @user
      @my_projects = @user.projects
    else
      @my_projects = @user.projects.where.not(display: 0)
    end
    
    @liked_projects = @user.liked_projects
  end

  def destroy
    user = current_user.destroy
    redirect_to root_path, notice: "「#{user.nickname}」を削除しました"
  end

  def follow_list
    if params[:target] == "follower"
      @title = "フォロワー"
      @users = @user.followers
    elsif params[:target] == "following"
      @title = "フォロー中"
      @users = @user.followings
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :email, :icon)
  end

  def only_myself
    set_user
    unless user_signed_in? && current_user == @user
      redirect_to root_path, alert: "自分の情報以外は更新・削除はできません"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
