class CreateAssociations < ActiveRecord::Migration[6.0]
  def change
    create_table :associations do |t|
      t.string     :name
      t.string     :website
      t.string     :location
      t.boolean    :is_international
      t.references :country
      t.integer    :status
      t.timestamps
    end
  end
end
