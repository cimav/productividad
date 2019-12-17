class AddExperienceStatus < ActiveRecord::Migration[6.0]
  def change
  	add_column :experiences, :status, :integer
  end
end
