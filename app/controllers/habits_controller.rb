class HabitsController < ApplicationController
  before_action :set_project
  before_action :set_habit, only: [:edit, :update, :show, :destroy]

  def new
    @habit = @project.habits.build
  end

  def create
    @habit = @project.habits.build(habit_params)
    if @habit.save
      create_check_ins(@habit)
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
    # 今日を基準に前後３日分
    @three_day_range = (Date.today - 3)..(Date.today + 3)
    # 今月分
    @month_range = Date.today.beginning_of_month..Date.today.end_of_month
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

  def create_check_ins(habit)
    (Date.today..(Date.today + 30)).each do |date|
      habit.check_ins.create(date: date, status: false)
    end
  end
end
