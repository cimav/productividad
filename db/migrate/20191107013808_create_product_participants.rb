class CreateProductParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :product_participants do |t|
      t.integer    :attachable_id
      t.string     :attachable_type
      t.references :person, null: true
      t.integer    :participation
      t.integer    :position
      t.integer    :participant_type
      t.string     :author_is
      t.integer    :status,     :null => false, :default => 1
      t.timestamps
    end
  end
end
