class AddStatusToProductFile < ActiveRecord::Migration[6.0]
  def change
  	add_column :product_files, :status, :integer
  end
end
