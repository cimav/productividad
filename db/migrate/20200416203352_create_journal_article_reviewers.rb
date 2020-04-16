class CreateJournalArticleReviewers < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_article_reviewers do |t|
      t.references :person
      t.string     :name
      t.string     :title
      t.text       :authors
      t.date       :review_date
      t.references :journal
      t.date       :last_date
      t.integer    :status 
      t.timestamps
    end
  end
end
