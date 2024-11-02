class HabitsController < ApplicationController
  before_action :set_project

  def new
    @habit = @project.habits.build
  end

  def create
    @habit = @project.habits.build(habit_params)
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def habit_params
    params.require(:habit).permit(:name, :content, :frequency)
  end
end
