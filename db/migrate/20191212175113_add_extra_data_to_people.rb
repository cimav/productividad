class AddExtraDataToPeople < ActiveRecord::Migration[6.0]
  def change
  	add_column :people, :about, :text
  end
end
