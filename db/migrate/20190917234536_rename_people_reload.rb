class RenamePeopleReload < ActiveRecord::Migration[6.0]
  def change
  	rename_column :people, :reload, :has_changed
  end
end
