class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @projects = @tag.projects.includes(:owner)
    add_breadcrumb @tag.tag_name, tag_path(@tag)
  end
end
