class CreateJournalCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_categories do |t|
      t.string     :name
      t.timestamps
    end
  end
end
