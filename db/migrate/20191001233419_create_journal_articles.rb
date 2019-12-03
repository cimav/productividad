class CreateJournalArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_articles do |t|
      t.string :title
      t.date :sent_date
      t.date :accepted_date
      t.date :published_date
      t.references :journal, null: false, foreign_key: true
      t.string :authors
      t.string :volume
      t.string :issue
      t.string :pages
      t.string :doi
      t.text :abstract
      t.references :person, null: true
      t.integer :status

      t.timestamps
    end
  end
end
