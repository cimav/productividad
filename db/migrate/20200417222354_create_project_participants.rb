class CreateProjectParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :project_participants do |t|
      t.references :project
      t.references :person, null: true
      t.integer    :participation
      t.integer    :role_type
      t.integer    :participant_type
      t.string     :role
      t.integer    :status,     :null => false, :default => 1
      t.timestamps
    end
  end
end
