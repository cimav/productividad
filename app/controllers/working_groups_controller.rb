class WorkingGroupsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Grupos de Trabajo'
    @crud_layout = 'config'
    self.add_field :name, "Nombre", :string
    self.add_field :organization_id, "Organización", :select, { options: Organization.order(:name).pluck(:name, :id)}

    employees_options = []
    employees = Person.where(person_type_id: 1).order(:first_name, :last_name).pluck(:id, :first_name, :last_name)
    employees.each do |e|
      employees_options << ["#{e[1]} #{e[2]}", e[0]]
    end
    self.add_field :person_id, "Administrado por", :select, {hide_index: true, options: employees_options}

    status_options = []
    status_options << ["Activo", WorkingGroup::ACTIVE]
    status_options << ["Inactivo", WorkingGroup::INACTIVE]
    self.add_field :status, "Estado", :select, { options: status_options}

    self.add_filter :select, [:organization_id], {options: Organization.order(:name).pluck(:name, :id) }
    self.add_filter :search, [:name], {placeholder: "Busqueda…"}
  end
end