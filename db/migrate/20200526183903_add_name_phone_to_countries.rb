class AddNamePhoneToCountries < ActiveRecord::Migration[6.0]
  def change
  	add_column :countries, :english_name, :string
  	add_column :countries, :code3, :string
  	add_column :countries, :phone_code, :string
  end
end
