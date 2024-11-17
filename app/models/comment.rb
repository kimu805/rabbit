class Comment < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :project

  # validation
  validates :text, presence: true
end
