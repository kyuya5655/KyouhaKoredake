class CreatePresents < ActiveRecord::Migration[6.1]
  def change
    create_table :presents do |t|

      t.integer :user_id, null: false
      t.integer :task_id, null: false
      t.integer :present, null: false
      
      t.timestamps
    end
  end
end
