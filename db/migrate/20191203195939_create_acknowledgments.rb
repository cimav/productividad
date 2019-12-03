class CreateAcknowledgments < ActiveRecord::Migration[6.0]
  def change
    create_table :acknowledgments do |t|
      t.integer    :attachable_id
      t.string     :attachable_type
      t.references :person, null: true
      t.integer    :position
      t.string     :notes
      t.integer    :status,     :null => false, :default => 1
      t.timestamps
    end
  end
end
