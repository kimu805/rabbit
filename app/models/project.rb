class Project < ApplicationRecord
  # association
  has_many :project_tag_relations
  has_many :tags, through: :project_tag_relations
  belongs_to :user
  has_many :habits, dependent: :destroy
  
  # enum
  enum display: {
    none_display: 0, # 非公開
    all_display: 1 # 公開
  }

  # validation
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
end
