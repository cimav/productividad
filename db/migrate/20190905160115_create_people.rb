class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :reload
      t.integer :status
      t.references :organization, null: true, foreign_key: true
      t.references :department, null: true, foreign_key: true
      t.references :people, null: true, foreign_key: true
      t.timestamps
    end
  end
end
