class CreateAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :announcements do |t|
      t.references :person
      t.string     :name
      t.date       :end_date
      t.string     :ammount
      t.string     :url
      t.integer    :status
      t.timestamps
    end
  end
end
