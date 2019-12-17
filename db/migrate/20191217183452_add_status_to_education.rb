class AddStatusToEducation < ActiveRecord::Migration[6.0]
  def change
  	add_column :educations, :status, :integer
  end
end
