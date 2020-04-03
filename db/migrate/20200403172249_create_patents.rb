class CreatePatents < ActiveRecord::Migration[6.0]
  def change
    create_table :patents do |t|
      t.string :title
      t.date    :register_date
      t.string :authors
      t.references :person
      t.integer :status
      t.date :last_date
      t.timestamps
    end
  end
end
