class Habit < ApplicationRecord
  # association
  belongs_to :project

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
  
end
