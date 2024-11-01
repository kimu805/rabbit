class ProjectTag
  include ActiveModel::Model
  attr_accessor :title, :description, :display, :user_id

  # validation
  with_options presence: true do 
    validates :title, length: { maximum: 50 }
  end
  validates :description, length: { maximum: 500 }

  # method
  def save
    Project.create(title: title, description: description, display: display, user_id: user_id )
  end
end