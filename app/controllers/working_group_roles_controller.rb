class WorkingGroupRolesController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Roles'
    @crud_layout = 'config'
    @crud_parent = :working_group
    @crud_parent_title = :name
    @crud_item_title = :name
    self.add_field :name, "Rol", :string
    status_options = []
    status_options << ["Activo", WorkingGroupRole::ACTIVE]
    status_options << ["Inactivo", WorkingGroupRole::INACTIVE]
    self.add_field :status, "Estado", :select, { options: status_options}

    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

  end
end