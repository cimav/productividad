class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.integer :book_type
      t.integer :publisher
      t.boolean :is_refereed
      t.references :country, null: false, foreign_key: true
      t.integer :status
      t.date :sent_date
      t.date :accepted_date
      t.date :published_date
      t.string :pages
      t.string :isbn
      t.references :person

      t.timestamps
    end
  end
end
