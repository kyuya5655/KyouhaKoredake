class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|

      t.integer :user_id, null: false
      t.integer :present_id, null: false
      t.string :task_name, null: false
      t.string :present, null: false
      t.integer :task_status, default: 0, null: false
      t.text :task_note
      t.date :start, null: false
      t.date :limit, null: false

      t.timestamps
    end
  end
end
