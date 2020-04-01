class CreateConferenceWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :conference_works do |t|
      t.string :title
      t.integer :work_type
      t.date :sent_date
      t.date :accepted_date
      t.date :published_date
      t.references :conference
      t.string :authors
      t.references :person
      t.integer :status
      t.timestamps
    end
  end
end
