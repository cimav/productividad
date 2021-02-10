class CreateProspectTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :prospect_teams do |t|
      t.references :prospect
      t.references :person, null: true
      t.text       :comments      
      t.integer    :participant_type
      t.integer    :status,     :null => false, :default => 1
      t.timestamps
    end
  end
end
