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
    @project = @user.projects.find(params[:project])
    @tag = @project.tags.find(params[:tag]) 
  end

  def destroy
    user = current_user.destroy
  end

  def follow_list
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile, :email)
  end

  def only_myself
    unless user_signed_in? && current_user.id == params[:id]
      redirect_to root_path, alert: "自分の情報以外は更新・削除はできません"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
