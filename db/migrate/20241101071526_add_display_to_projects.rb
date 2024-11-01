class AddDisplayToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :display, :integer
  end
end
