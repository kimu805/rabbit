class ProjectTag
  include ActiveModel::Model
  attr_accessor :title, :description, :display, :user_id

  # validation
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
  validates :display, presence: true, inclusion
end