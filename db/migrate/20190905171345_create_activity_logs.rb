class CreateActivityLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :activity_logs do |t|
      t.integer    :attachable_id
      t.string     :attachable_type
      t.text       :message
      t.integer    :status,     :null => false, :default => 1
      t.timestamps
    end
  end
end
