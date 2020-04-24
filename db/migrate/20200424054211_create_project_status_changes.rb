class CreateProjectStatusChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :project_status_changes do |t|
      t.references :person
      t.references :project
      t.integer    :from
      t.integer    :to
      t.date       :change_date
      t.integer    :status, :null => false, :default => 1
      t.timestamps
    end
  end
end
