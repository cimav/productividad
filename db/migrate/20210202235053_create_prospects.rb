class CreateProspects < ActiveRecord::Migration[6.1]
  def change
    create_table :prospects do |t|
      t.references :person
      t.string     :subject
      t.string     :organization
      t.string     :contact
      t.integer    :decision_type
      t.string     :phone
      t.string     :email
      t.string     :address
      t.references :country
      t.string     :source
      t.integer    :status
      t.timestamps
    end
  end
end
