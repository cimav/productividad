class CreateProductCites < ActiveRecord::Migration[6.0]
  def change
    create_table :product_cites do |t|
      t.integer    :attachable_id
      t.string     :attachable_type
      t.references :journal_article
      t.references :journal, null: false
      t.string     :title
      t.string     :authors
      t.string     :volume
      t.string     :issue
      t.string     :pages
      t.date       :published_date
      t.string     :doi
      t.references :person, null: true
      t.integer    :status,     :null => false, :default => 1
      t.timestamps
    end
  end
end
