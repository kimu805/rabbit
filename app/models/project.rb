class Project < ApplicationRecord
  # association
  has_many :project_tag_relations, dependent: :destroy
  has_many :tags, through: :project_tag_relations
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :habits, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  has_many :view_counts, dependent: :destroy
  
  # enum
  enum display: {
    none_display: 0, # 非公開
    all_display: 1 # 公開
  }

  # validation
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

  # scope
  scope :more_view, ->(tag_id) {
    select("projects.*, COUNT(view_counts.id) AS view_count")
      .joins(:project_tag_relations)
      .left_joins(:view_counts)
      .where(project_tag_relations: { tag_id: tag_id }, display: 1)
      .group("projects.id")
      .order("view_count DESC")
  }

  # method
  def overall_achievement_rate
    total_completed_count = 0
    total_required_count = 0

    self.habits.each do |habit|
      start_date = habit.start_date || habit.created_at.to_date
      end_date = habit.end_date || Date.today

      completed_count = habit.check_ins.where(status: true, date: start_date..end_date).count
      required_count = case habit.frequency
      when "daily"
        (end_date - start_date).to_i + 1
      when "every_2_days"
        ((end_date - start_date).to_i / 2.0).ceil
      when "every_3_days"
        ((end_date - start_date).to_i / 3.0).ceil
      when "every_4_days"
        ((end_date - start_date).to_i / 4.0).ceil
      when "every_5_days"
        ((end_date - start_date).to_i / 5.0).ceil
      when 'every_6_days'
        ((end_date - start_date).to_i / 6.0).ceil
      when 'weekly'
        ((end_date - start_date).to_i / 7.0).ceil
      else
        0
      end

      total_completed_count += completed_count
      total_required_count += required_count
    end
    
    if total_required_count == 0
      return 0
    else
      ((total_completed_count.to_f / total_required_count) * 100).round(2)
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  # ransack
  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["owner"]
  end
end
