class AddLastDateAndRejectedDateToJournalArticles < ActiveRecord::Migration[6.0]
  def change
  	add_column :journal_articles, :last_date, :date
  	add_column :journal_articles, :rejected_date, :date
  end
end
