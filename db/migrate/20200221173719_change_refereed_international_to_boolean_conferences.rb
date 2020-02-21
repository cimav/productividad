class ChangeRefereedInternationalToBooleanConferences < ActiveRecord::Migration[6.0]
  def change
  	change_column :conferences, :is_refereed, :boolean
  	change_column :conferences, :is_international, :boolean
  end
end
