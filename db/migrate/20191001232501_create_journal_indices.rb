class CreateJournalIndices < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_indices do |t|
      t.references :journal, null: false, foreign_key: true
      t.references :indexer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
