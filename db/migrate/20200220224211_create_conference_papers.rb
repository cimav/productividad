class CreateConferencePapers < ActiveRecord::Migration[6.0]
  def change
    create_table :conference_papers do |t|
      t.string :title
      t.date :sent_date
      t.date :accepted_date
      t.date :published_date
      t.references :conference
      t.string :authors
      t.text :abstract
      t.references :person
      t.integer :status

      t.timestamps
    end
  end
end
