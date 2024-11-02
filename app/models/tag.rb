class Tag < ApplicationRecord
  # association
  has_many :project_tag_relations
  has_many :projects, through: :project_tag_relations

  # validation
  validates :tag_name, presence: true, uniqueness: true, length: { maximum: 20 }
end
