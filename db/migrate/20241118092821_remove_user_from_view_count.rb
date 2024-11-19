class RemoveUserFromViewCount < ActiveRecord::Migration[7.0]
  def change
    remove_reference :view_counts, :user, null: false, foreign_key: true
  end
end
