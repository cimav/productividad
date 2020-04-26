class CreateWorkingGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :working_groups do |t|
      t.string :name
      t.integer :status
      t.references :person
      t.references :organization, null: true
      t.timestamps
    end
  end
end
