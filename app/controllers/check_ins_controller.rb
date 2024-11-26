class CheckInsController < ApplicationController
  before_action :before_set
  before_action :only_myself

  def update
    check_in = CheckIn.find_by(id: params[:id])
    if check_in
      check_in.status = params[:check_in][:status] == "1"
      check_in.save

      # 各習慣の達成率を取得
      achievement_rate = @habit.achievement_rate(@habit.start_date || @habit.created_at.to_date, @habit.end_date || Date.today ).to_f
      # プロジェクト全体の達成率を取得
      overall_achievement_rate = @project.overall_achievement_rate.to_f

      render json: { check_in: check_in, achievement_rate: achievement_rate, overall_achievement_rate: overall_achievement_rate }
    end
  end

  private
  def before_set
    @project = Project.find(params[:project_id])
    @habit = Habit.find(params[:habit_id])
  end

  def only_myself
    before_set
    unless user_signed_in? && current_user == @project.owner
      redirect_to @project, alert: "他人の習慣にチェックはつけれません"
    end
  end

end
