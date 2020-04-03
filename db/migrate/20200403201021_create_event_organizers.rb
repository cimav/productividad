class CreateEventOrganizers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_organizers do |t|
      t.integer :organizer_type
      t.text :activity
      t.date :last_date
      t.references :conference
      t.references :person
      t.integer :status
      t.timestamps
    end
  end
end
