class CreateAwards < ActiveRecord::Migration[6.0]
  def change
    create_table :awards do |t|
      t.references :person
      t.string     :name
      t.integer    :award_type
      t.string     :granted_by
      t.date       :grant_date
      t.date       :last_date
      t.references :country
      t.integer    :status
      t.timestamps
    end
  end
end
