class ProjectTagRelation < ApplicationRecord
  # association
  belongs_to :project
  belongs_to :tag
end
