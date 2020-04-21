class CreateGanttTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :gantt_tasks do |t|
      t.references :project
      t.references :person
      t.string :text
      t.datetime :start_date
      t.integer :duration
      t.integer :parent
      t.decimal :progress
      t.integer :sortorder
      t.timestamps
    end
  end
end
