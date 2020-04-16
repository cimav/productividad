class CreateRelevantActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :relevant_activities do |t|
      t.references :person
      t.string     :name
      t.integer    :activity_type
      t.text       :description
      t.string     :location
      t.references :country
      t.date       :start_date
      t.date       :end_date
      t.date       :last_date
      t.integer    :status 
      t.timestamps
    end
  end
end
