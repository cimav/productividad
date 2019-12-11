class AddSubmittedByToJournal < ActiveRecord::Migration[6.0]
  def change
  	add_column :journals, :submitted_by, :integer
  	add_column :journals, :validated, :integer
  end
end
