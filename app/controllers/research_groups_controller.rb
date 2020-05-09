class ResearchGroupsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Grupos de Investigación'
    @crud_layout = 'config'
    self.add_field :name, "Nombre", :string
    self.add_field :department_id, "Departamento", :select, { options: Department.order(:name).pluck(:name, :id)}
    self.add_field :description, "Descripción", :text

    self.add_filter :select, [:department_id], {options: Department.order(:name).pluck(:name, :id) }
    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

    self.add_child :research_sub_group, "Subgrupos"

  end
end