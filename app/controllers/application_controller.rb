class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :icon])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def find_or_create_check_ins(habits_or_habit, date_range)
    habits = Array(habits_or_habit)
    existing_check_ins = CheckIn.where(habit_id: habits.map(&:id), date: date_range).index_by { |ci| [ci.habit_id, ci.date] }

    date_range.flat_map do |date|
      habits.map do |habit|
        existing_check_ins[[habit.id, date]] || CheckIn.create(habit_id: habit.id, date: date)
      end
    end
  end
end
