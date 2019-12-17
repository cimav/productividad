class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :title
      t.integer :experience_type
      t.string :company
      t.string :location
      t.date :start_date
      t.date :end_date
      t.references :person, null: true
      t.timestamps
    end
  end
end
