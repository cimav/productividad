class CreateAssociationMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :association_members do |t|
      t.references :association
      t.references :person
      t.date       :start_date
      t.date       :end_date
      t.text       :activities
      t.integer    :status
      t.timestamps
    end
  end
end
