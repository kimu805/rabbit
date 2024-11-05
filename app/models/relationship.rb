class Relationship < ApplicationRecord
  # association
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
end
