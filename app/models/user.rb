class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_projects, through: :likes, source: :project
  ## follow
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following
  ## active_storage
  has_one_attached :icon

  # validation
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 500 }

  # method
  def followed_by?(following_user)
    follower = passive_relationships.find_by(following_id: following_user.id)
    return follower.present?
  end

  # ransack

  def self.ransackable_attributes(auth_object = nil)
    ["nickname"]
  end

end
