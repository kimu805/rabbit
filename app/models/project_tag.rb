class ProjectTag
  include ActiveModel::Model
  attr_accessor :id, :title, :description, :display, :user_id, :created_at, :updated_at, :tag_name

  attr_reader :project

  # validation
  with_options presence: true do 
    validates :title, length: { maximum: 50 }
    validates :display
    validates :tag_name
  end
  validates :description, length: { maximum: 500 }

  # method
  def save
    @project = Project.create( title: title, description: description, display: display, user_id: user_id )
    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ProjectTagRelation.create(project_id: @project.id, tag_id: tag.id)
    end
  end

  def update(params, project)
    project.project_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)

    if tag_name.present?
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save
      ProjectTagRelation.create(project_id: project.id, tag_id: tag.id)
    end

    project.update(params)
  end
end