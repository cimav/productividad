class AddLastDateToWorks < ActiveRecord::Migration[6.0]
  def change
  	add_column :conference_works, :last_date, :date
  end
end
