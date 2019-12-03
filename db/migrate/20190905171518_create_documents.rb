class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.integer    :attachable_id
      t.string     :attachable_type
      t.references :user
      t.integer    :file_type
      t.string     :description
      t.string     :file
      t.integer    :status, :null => false, :default => 1
      t.timestamps
    end
  end
end
