class AddNotesToJournalArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :journal_articles, :notes, :text
  end
end
