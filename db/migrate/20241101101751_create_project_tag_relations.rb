class CreateProjectTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :project_tag_relations do |t|

      t.timestamps
    end
  end
end
