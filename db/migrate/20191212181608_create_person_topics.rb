class CreatePersonTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :person_topics do |t|
      t.references :person, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
