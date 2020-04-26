class ResearchSubGroupsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Grupos de Investigación'
    @crud_layout = 'config'
    self.add_field :name, "Nombre", :string
    self.add_field :research_group_id, "Grupo de Investigación", :select, { options: ResearchGroup.order(:name).pluck(:name, :id)}
    self.add_field :description, "Descripción", :text

    self.add_filter :select, [:research_group_id], {options: ResearchGroup.order(:name).pluck(:name, :id) }
    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

  end
end