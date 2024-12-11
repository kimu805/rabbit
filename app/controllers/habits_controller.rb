class HabitsController < ApplicationController
  before_action :set_project
  before_action :set_habit, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: :show
  before_action :only_myself, except: :show

  def new
    @habit = @project.habits.build
  end

  def create
    @habit = @project.habits.build(habit_params)
    if @habit.save
      redirect_to @project, notice: "「#{@habit.name}」を作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @habit.update(habit_params)
      redirect_to project_habit_path(project_id: @project.id, id: @habit.id), notice: "「#{@habit.name}」を編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    if params[:tag]
      @tag = @project.tags.find(params[:tag])
    end

    @end_date = params[:end_date].present? ? Date.parse(params[:end_date]) : Date.today
    @start_date = params[:start_date].present? ? Date.parse(params[:start_date]) : @end_date - 3
    @date_range = (@start_date..@end_date)

    @check_ins = find_or_create_check_ins(@habit, @date_range)
  end

  def destroy
    @habit.destroy
    redirect_to @project, notice: "「#{@habit.name}」を削除しました"
  end

  private
  def habit_params
    params.require(:habit).permit(:name, :content, :frequency, :start_date, :end_date)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_habit
    @habit = @project.habits.find(params[:id])
  end

  def only_myself
    set_project
    
    unless user_signed_in? && @project.owner == current_user
      redirect_to project_path(@project), alert: "他のユーザーの習慣にチェックはつけれません"
    end
  end
end
