class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :except_myself
  before_action :set_user

  def create
    follower = current_user.active_relationships.new(follower_id: @user.id)
    follower.save
    render partial: "relationships/follow_btn", locals: { user: @user }
  end

  def destroy
    follower = current_user.active_relationships.find_by(follower_id: @user.id)
    follower.destroy
    render partial: "relationships/follow_btn", locals: { user: @user }
  end

  private
  def except_myself
    if current_user == @user
      redirect_to user_path(current_user.id), alert: "自分自身をフォローすることはできません"
    end
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
