class CreateConferences < ActiveRecord::Migration[6.0]
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :place
      t.references :country
      t.date :start_date
      t.date :end_date
      t.string :organizer
      t.integer :is_international
      t.integer :is_refereed
      t.integer :status
      t.timestamps
    end
  end
end
