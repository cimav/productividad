class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks do |t|
      t.references :project_task_list
      t.references :person, null: true
      t.string     :name
      t.integer    :position
      t.integer    :assigned_to
      t.integer    :done
      t.date       :done_date
      t.integer    :status,     :null => false, :default => 1	
      t.timestamps
    end
  end
end
