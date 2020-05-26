class AddEigenToJournals < ActiveRecord::Migration[6.0]
  def change
    add_column :journal_impact_factors, :eigen_factor, :string
  end
end
