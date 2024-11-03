class HabitsController < ApplicationController
  before_action :set_project
  before_action :set_habit, only: [:edit, :update, :show, :destroy]

  def new
    @habit = @project.habits.build
  end

  def create
    @habit = @project.habits.build(habit_params)
    if @habit.save
      redirect_to @project
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
  end

  def destroy
    @habit.destroy
    redirect_to @project, notice: "「#{@habit.name}」を削除しました"
  end

  private
  def habit_params
    params.require(:habit).permit(:name, :content, :frequency)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_habit
    @habit = @project.habits.find(params[:id])
  end
end
