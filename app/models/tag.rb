class Tag < ApplicationRecord
  # association
  has_many :project_tag_relations
  has_many :projects, through: :project_tag_relations
end
