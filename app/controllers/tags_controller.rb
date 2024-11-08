class TagsController < ApplicationController
  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result(distinct: true)
  end

  def show
    @tag = Tag.find(params[:id])
    @projects = @tag.projects.includes(:owner)
  end
end
