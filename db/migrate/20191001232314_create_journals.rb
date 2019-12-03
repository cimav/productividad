class CreateJournals < ActiveRecord::Migration[6.0]
  def change
    create_table :journals do |t|
      t.string :name
      t.string :website
      t.boolean :is_refereed
      t.boolean :is_international
      t.boolean :is_indexed
      t.string :issn
      t.string :e_issn
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
