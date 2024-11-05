class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :except_myself

  def create
    follower = current_user.active_relationships.new(follower_id: params[:user_id])
    follower.save
    redirect_to user_path(params[:user_id])
  end

  def destroy
    follower = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follower.destroy
    redirect_to user_path(params[:user_id])
  end

  private
  def except_myself
    if current_user.id == params[:user_id]
      redirect_to user_path(current_user.id), alert: "自分自身をフォローすることはできません"
    end
  end
end
