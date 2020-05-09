class ResearchSubGroupsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Sub-Grupos de Investigación'
    @crud_layout = 'config'
    @crud_parent = :research_group
    @crud_parent_title = :name
    @crud_item_title = :name
    self.add_field :name, "Nombre", :string
    self.add_field :description, "Descripción", :text

    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

  end
end