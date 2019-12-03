class AddShortnameToOrganizations < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :shortname, :string
  end
end
