class CreateGanttLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :gantt_links do |t|
      t.references :project
      t.integer :source
      t.integer :target
      t.string :link_type
      t.timestamps
    end
  end
end
