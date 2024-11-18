class RemoveViewCountFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :view_count, :integer
  end
end
