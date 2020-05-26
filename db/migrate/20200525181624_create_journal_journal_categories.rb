class CreateJournalJournalCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_journal_categories do |t|
      t.references :journal
      t.references :journal_category
      t.timestamps
    end
  end
end


