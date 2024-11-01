class Project < ApplicationRecord
  
  # enum
  enum display: {
    none_display: 0, # 非公開
    follower_only: 1, # フォロワーにのみ公開
    all_display: 2 # 公開
  }
end
