class CreateEducations < ActiveRecord::Migration[6.0]
  def change
    create_table :educations do |t|
      t.string :title
      t.integer :degree
      t.references :organization, null: true
      t.string :faculty
      t.integer :start_year
      t.integer :end_year
      t.references :person, null: true
      t.timestamps
    end
  end
end
