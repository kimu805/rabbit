class RemoveDisplayFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :display, :boolean
  end
end
