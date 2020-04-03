class CreateInvitedConferences < ActiveRecord::Migration[6.0]
  def change
    create_table :invited_conferences do |t|
      t.string :title
      t.date :conference_date
      t.date :last_date
      t.references :conference
      t.references :person
      t.integer :status
      t.timestamps
    end
  end
end
