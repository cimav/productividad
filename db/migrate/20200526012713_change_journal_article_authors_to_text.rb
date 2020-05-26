class ChangeJournalArticleAuthorsToText < ActiveRecord::Migration[6.0]
  def change
    change_column :journal_articles, :authors, :text
  end
end
