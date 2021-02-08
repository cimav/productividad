class AddConsecutiveCodeToProspects < ActiveRecord::Migration[6.1]
  def change
    add_column :prospects, :consecutive, :integer
    add_column :prospects, :code, :string
  end
end
