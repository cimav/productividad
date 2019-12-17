class CreateResearchLines < ActiveRecord::Migration[6.0]
  def change
    create_table :research_lines do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
