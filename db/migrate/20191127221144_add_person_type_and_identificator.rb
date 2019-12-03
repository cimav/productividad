class AddPersonTypeAndIdentificator < ActiveRecord::Migration[6.0]
  def change
  	add_column :people, :identificator, :string
  	add_column :people, :person_type_id, :integer
  end
end
