class Tag < ApplicationRecord
  # association
  has_many :project_tag_relations, dependent: :destroy
  has_many :projects, through: :project_tag_relations

  # validation
  validates :tag_name, presence: true, uniqueness: true, length: { maximum: 20 }

  # ransack
  def self.ransackable_attributes(auth_object = nil)
    ["tag_name"]
  end

  # scope
  scope :popular, -> {
    select("tags.*, COUNT(project_tag_relations.project_id) AS projects_count")
      .joins(:project_tag_relations)
      .group("tags.id")
      .order("projects_count DESC")
  }
end
