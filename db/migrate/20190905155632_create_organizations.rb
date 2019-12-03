class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :website
      t.string :email
      t.string :address1
      t.string :address2
      t.text :description
      t.integer :lat
      t.integer :long
      t.integer :status
      t.references :city, null: true, foreign_key: true
      t.references :country, null: true, foreign_key: true
      t.references :organization, null: true, foreign_key: true
      t.timestamps
    end
  end
end
