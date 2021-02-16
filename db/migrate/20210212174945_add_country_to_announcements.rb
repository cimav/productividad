class AddCountryToAnnouncements < ActiveRecord::Migration[6.1]
  def change
     add_column :announcements, :country_id, :integer
  end
end
