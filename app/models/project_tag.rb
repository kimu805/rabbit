class ProjectTag
  include ActiveModel::Model
  attr_accessor :title, :description, :display, :user_id

  # validation
  with_options presence: true do 
    validates :title, length: { maximum: 50 }
    validates :display, inclusion: { in: [0,1,2], message: "は0、1、2、のいずれかである必要があります。"}
  end
  validates :description, length: { maximum: 500 }
  
end