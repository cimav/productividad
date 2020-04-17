class CreateProjectMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :project_messages do |t|
      t.references :person
      t.references :project
      t.string     :title
      t.integer    :status
      t.timestamps
    end
  end
end
