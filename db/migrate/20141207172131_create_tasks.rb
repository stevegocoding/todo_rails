class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :desc, null: false
      t.date :due_date
      t.integer :priority
      t.boolean :completed, null: false, default: false
      t.references :owner, null: false, index: true
      t.references :project
      t.references :task_list
      
      t.timestamps
    end
  end
end
