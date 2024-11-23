class TagsController < ApplicationController
  def index
    @q = Tag.ransack(params[:q])
    @tags = @q.result(distinct: true).popular
  end

  def show
    @tag = Tag.find(params[:id])
    @q = @tag.projects.where(display: 1).includes(:owner).ransack(params[:q])
    @projects = @q.result(distinct: true).more_view(@tag.id)
  end
end
