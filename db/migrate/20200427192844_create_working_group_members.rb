class CreateWorkingGroupMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :working_group_members do |t|
      t.references :person
      t.references :working_group
      t.references :working_group_role
      t.text       :activities
      t.date       :start_date
      t.date       :end_date
      t.date       :last_date
      t.integer    :status
      t.timestamps
    end
  end
end
