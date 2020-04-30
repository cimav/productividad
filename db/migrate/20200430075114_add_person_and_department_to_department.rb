class AddPersonAndDepartmentToDepartment < ActiveRecord::Migration[6.0]
  def change
  	add_column :departments, :person_id, :integer
  	add_column :departments, :department_id, :integer, :default => 1
  end
end
