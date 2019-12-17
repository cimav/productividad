class ChangeDegreeEducation < ActiveRecord::Migration[6.0]
  def change
    rename_column :educations, :degree, :degree_id
  end
end
