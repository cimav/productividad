class CreateProjectTaskLists < ActiveRecord::Migration[6.0]
  def change
    create_table :project_task_lists do |t|
      t.references :project
      t.references :person, null: true
      t.string     :name
      t.integer    :position
      t.integer    :status,     :null => false, :default => 1	
      t.timestamps
    end
  end
end
