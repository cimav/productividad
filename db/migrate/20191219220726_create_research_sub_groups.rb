class CreateResearchSubGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :research_sub_groups do |t|
      t.string :name
      t.text :description
      t.references :research_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
