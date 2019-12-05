class CreateProductFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :product_files do |t|
      t.integer    :attachable_id
      t.string     :attachable_type
      t.string     :file
      t.integer    :file_type
      t.references :person, null: true
      t.text       :notes
      t.timestamps
    end
  end
end
