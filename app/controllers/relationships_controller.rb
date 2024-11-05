class RelationshipsController < ApplicationController
  before_action :authenticate_user!

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
end
