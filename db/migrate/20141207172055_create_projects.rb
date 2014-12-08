class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false 
      t.string :desc
      t.references :owner, null: false
      
      t.timestamps
    end
    
    add_index :projects, :owner_id
  end
end
