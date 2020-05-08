class AddValidatedToAssociations < ActiveRecord::Migration[6.0]
  def change
  	add_column :associations, :submitted_by, :integer
    add_column :associations, :validated, :integer
  end
end
