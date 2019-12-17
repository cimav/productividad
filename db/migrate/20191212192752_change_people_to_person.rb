class ChangePeopleToPerson < ActiveRecord::Migration[6.0]
  def change
  	rename_column :people, :people_id, :person_id
  end
end
