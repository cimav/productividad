class JournalImpactFactorsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Factores de Impacto'
    @crud_container = 'crud-container'
    @crud_parent = :journal
    @crud_parent_title = :name
    @crud_item_title = :year
    self.add_field :year, "Año", :string
    self.add_field :impact_factor, "Factor de Impacto", :string
  end
end