class CreateProspectStatusChanges < ActiveRecord::Migration[6.1]
  def change
    create_table :prospect_status_changes do |t|
      t.references :person
      t.references :prospect
      t.integer    :from
      t.integer    :to
      t.date       :change_date
      t.integer    :status, :null => false, :default => 1
      t.timestamps
    end
  end
end
