class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def new
    @project_tag = ProjectTag.new
  end

  def create
    @project_tag = ProjectTag.new(project_tag_params)
    if @project_tag.valid?
      @project_tag.save
      redirect_to user_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    project_attributes = @project.attributes
    @project_tag = ProjectTag.new(project_attributes)
    @project_tag.tag_name = @project.tags.first&.tag_name
  end

  def update
    @project_tag = ProjectTag.new(project_tag_params)
    if @project_tag.valid?
      @project_tag.update(project_tag_params, @project)
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @habits = @project.habits
    @tag = @project.tags.find_by(params[:tag])

    if parmas[:range] == "three_days"
      @three_day_range = (Date.today - 3)..(Date.today + 3)
      @check_ins = CheckIn.where(habit_id: @habits.map(&:id), date: @three_day_range).index_by {|ci| [ci.habit_id, ci.date] }
    elsif params[:range] == "month"
      @month_range = Date.today.beginning_of_month..Date.today.end_of_month
      @check_ins = CheckIn.where(habit_id: @habits.map(&:id), date: @month_range).index_by {|ci| [ci.habit_id, ci.date] }
    end
  end

  def destroy
    binding.pry
    @project.destroy
    redirect_to user_path(current_user)
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(["tag_name LIKE ?", "%#{params[:keyword]}%"])
    render json: { keyword: tag }
  end

  private
  def project_tag_params
    params.require(:project_tag).permit(:title, :description, :display, :tag_name).merge(user_id: current_user.id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
