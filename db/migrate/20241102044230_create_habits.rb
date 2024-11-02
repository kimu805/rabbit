class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :name, null: false
      t.text :content
      t.integer :frequency, null: false
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
