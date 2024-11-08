class AddDateToHabits < ActiveRecord::Migration[7.0]
  def change
    add_column :habits, :start_date, :date
    add_column :habits, :end_date, :date
  end
end
