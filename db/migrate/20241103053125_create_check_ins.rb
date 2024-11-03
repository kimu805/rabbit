class CreateCheckIns < ActiveRecord::Migration[7.0]
  def change
    create_table :check_ins do |t|
      t.date :date, null: false
      t.boolean :status, null: false, default: false
      t.references :habit, null: false, foreign_key: true
      t.timestamps
    end
  end
end
