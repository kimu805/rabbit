class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # association
  has_many :projects, dependent: :destroy

  # validation
  validates :nickname, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 500 }

end
