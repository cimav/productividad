class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :code
      t.integer :lat
      t.integer :long
      t.integer :status
      t.timestamps
    end
  end
end
