class CreateProjectDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :project_documents do |t|
      t.references :person
      t.references :project
      t.integer    :file_type
      t.integer    :parent
      t.string     :name
      t.string     :url
      t.integer    :status, :null => false, :default => 1
      t.timestamps
    end
  end
end
