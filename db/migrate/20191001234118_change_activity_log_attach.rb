class ChangeActivityLogAttach < ActiveRecord::Migration[6.0]
  def change
  	add_column :activity_logs, :changed_values, :text
  	add_column :activity_logs, :person_id, :integer
    rename_column :activity_logs, :attachable_id, :item_id
    rename_column :activity_logs, :attachable_type, :item_type
  end
end
