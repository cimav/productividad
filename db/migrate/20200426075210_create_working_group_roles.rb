class CreateWorkingGroupRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :working_group_roles do |t|
      t.string :name
      t.integer :status
      t.references :working_group
      t.timestamps
    end
  end
end
