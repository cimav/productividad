class AddLastDateToAssociationMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :association_members, :last_date, :date
  end
end
