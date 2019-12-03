class CreateJournalImpactFactors < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_impact_factors do |t|
      t.references :journal, null: false, foreign_key: true
      t.integer :year
      t.string :impact_factor

      t.timestamps
    end
  end
end
