class AddPublisherToJournals < ActiveRecord::Migration[6.0]
  def change
  	add_column :journals, :publisher, :text
    add_column :journals, :publisher_address, :text
    add_column :journals, :language, :string
    add_column :journals, :wos_categories, :text
  end
end
