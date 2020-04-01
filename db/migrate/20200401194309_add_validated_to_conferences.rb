class AddValidatedToConferences < ActiveRecord::Migration[6.0]
  def change
  	add_column :conferences, :submitted_by, :integer
    add_column :conferences, :validated, :integer
  end
end
