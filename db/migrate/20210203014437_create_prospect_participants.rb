class CreateProspectParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :prospect_participants do |t|
      t.references :prospect
      t.references :person, null: true
      t.integer    :suggested_by
      t.text       :suggester_comments
      t.text       :suggested_comments      
      t.integer    :participant_type
      t.integer    :status,     :null => false, :default => 1
      t.timestamps
    end
  end
end