class CreatePersonResearchLines < ActiveRecord::Migration[6.0]
  def change
    create_table :person_research_lines do |t|
      t.references :person, null: false, foreign_key: true
      t.references :research_line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
