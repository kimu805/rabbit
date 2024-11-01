class Project < ApplicationRecord
  # association
  has_many :project_tag_relations
  has_many :tags, through: :project_tag_relations
  
  # enum
  enum display: {
    none_display: 0, # 非公開
    follower_only: 1, # フォロワーにのみ公開
    all_display: 2 # 公開
  }
end
