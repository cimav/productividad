class ChangeExperienceType < ActiveRecord::Migration[6.0]
  def change
    rename_column :experiences, :experience_type, :experience_type_id
  end
end
