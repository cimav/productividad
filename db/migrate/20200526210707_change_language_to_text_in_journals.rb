class ChangeLanguageToTextInJournals < ActiveRecord::Migration[6.0]
  def change
  	change_column :journals, :language, :text
  end
end
