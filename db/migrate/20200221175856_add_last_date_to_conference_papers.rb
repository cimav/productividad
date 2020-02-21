class AddLastDateToConferencePapers < ActiveRecord::Migration[6.0]
  def change
  	add_column :conference_papers, :last_date, :date
  end
end
