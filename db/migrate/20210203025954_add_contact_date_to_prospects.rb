class AddContactDateToProspects < ActiveRecord::Migration[6.1]
  def change
  	add_column :prospects, :contact_date, :date
  end
end
