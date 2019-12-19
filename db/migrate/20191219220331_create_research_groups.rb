class CreateResearchGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :research_groups do |t|
      t.string :name
      t.text :description
      t.references :department, null: false, foreign_key: true
      t.timestamps
    end
  end
end
