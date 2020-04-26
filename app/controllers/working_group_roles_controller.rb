class WorkingGroupRolesController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Roles de Grupos de Trabajo'
    @crud_layout = 'config'
    self.add_field :name, "Rol", :string
    self.add_field :working_group_id, "Grupo de Trabajo", :select, { options: WorkingGroup.order(:name).pluck(:name, :id)}

    self.add_filter :select, [:working_group_id], {options: WorkingGroup.order(:name).pluck(:name, :id) }
    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

  end
end