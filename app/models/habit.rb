class Habit < ApplicationRecord
  # association
  belongs_to :project
  has_many :check_ins, dependent: :destroy

  # enum
  enum frequency: {
    daily: 1,           # 毎日
    every_2_days: 2,    # 2日に1回
    every_3_days: 3,    # 3日に1回
    every_4_days: 4,    # 4日に1回
    every_5_days: 5,    # 5日に1回
    every_6_days: 6,    # 6日に1回
    weekly: 7           # 7日に1回（毎週）
  }

  # validation
  with_options presence: true do
    validates :name, length: { maximum: 20 }
    validates :frequency
  end
  validates :content, length: { maximum: 500 }

  # method
  def achievement_rate(start_date, end_date)
    total_days = (end_date - start_date).to_i + 1
    completed_count = check_ins.where(status: true, date: start_date..end_date).count

    required_count = case frequency
    when 'daily'
      total_days
    when 'every_2_days'
      (total_days / 2.0).ceil
    when 'every_3_days'
      (total_days / 3.0).ceil
    when 'every_4_days'
      (total_days / 4.0).ceil
    when 'every_5_days'
      (total_days / 5.0).ceil
    when 'every_6_days'
      (total_days / 6.0).ceil
    when 'weekly'
      (total_days / 7.0).ceil
    else
      0
    end

    return 0 if required_count.zero?

    ((completed_count.to_f / required_count) * 100).round(2)
  end
end
