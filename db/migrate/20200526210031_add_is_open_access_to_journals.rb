class AddIsOpenAccessToJournals < ActiveRecord::Migration[6.0]
  def change
  	add_column :journals, :is_open_access, :boolean
  end
end
