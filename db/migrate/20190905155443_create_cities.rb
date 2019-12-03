class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :lat
      t.integer :long
      t.integer :status
      t.references :country, null: true, foreign_key: true
      t.timestamps
    end
  end
end
