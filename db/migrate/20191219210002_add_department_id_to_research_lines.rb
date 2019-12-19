class AddDepartmentIdToResearchLines < ActiveRecord::Migration[6.0]
  def change
    add_column :research_lines, :department_id, :integer
  end
end
