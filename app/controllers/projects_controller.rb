class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :only_myself, only: [:edit, :update, :destroy]

  def new
    @project_tag = ProjectTag.new
  end

  def create
    @project_tag = ProjectTag.new(project_tag_params)
    if @project_tag.valid?
      @project_tag.save
      project = @project_tag.project
      redirect_to project_path(project)
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
    @habits = @project.habits.includes(:check_ins)
    @tag = @project.tags.find_by(id: params[:tag])

    @end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : Date.today
    @start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : [ @end_date - 3].min
    @date_range = (@start_date..@end_date)

    @check_ins = find_or_create_check_ins(@habits, @date_range)

    if current_user
      @comment = current_user.comments.build
    end
    @comments = @project.comments.includes(:user)
    
    increment_view_count(@project)
  end

  def destroy
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

  def find_or_create_check_ins(habits, date_range)
    existing_check_ins = CheckIn.where(habit_id: habits.map(&:id), date: date_range).index_by { |ci| [ci.habit_id, ci.date] }

    date_range.flat_map do |date|
      habits.map do |habit|
        existing_check_ins[[habit.id, date]] || CheckIn.create(habit_id: habit.id, date: date)
      end
    end
  end

  def increment_view_count(project)
    session_key = "project_#{project.id}_viewed"
    unless session[session_key]
      ViewCount.create!(project_id: @project.id)
      session[session_key] = true
    end
  end

  def only_myself
    set_project
    unless current_user == @project.owner
      redirect_to @project, alert: "他のユーザーのプロジェクトは編集・削除できません"
    end
  end
end
