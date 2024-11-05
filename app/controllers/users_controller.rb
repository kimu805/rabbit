class UsersController < ApplicationController
  before_action :only_myself, except: :show

  def edit
  end

  def update
    if current_user.update(user_params)
      
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    current_user.destroy
    redirect_to root_path
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
end
