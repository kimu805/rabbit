class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|

      t.timestamps
    end
  end
end
