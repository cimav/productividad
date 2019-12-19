class AddStatusToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :status, :integer
  end
end
