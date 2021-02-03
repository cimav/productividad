class AddIsScientificToDepartment < ActiveRecord::Migration[6.1]
  def change
  	add_column :departments, :is_scientific, :boolean
  end
end
