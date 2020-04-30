class DepartmentsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Departamentos'
    @crud_layout = 'config'
    self.add_field :name, "Nombre", :string
    self.add_field :department_id, "Bajo Departamento", :select, { options: Department.order(:name).pluck(:name, :id)}
    employees_options = []
    employees = Person.where(person_type_id: 1).order(:first_name, :last_name).pluck(:id, :first_name, :last_name)
    employees.each do |e|
      employees_options << ["#{e[1]} #{e[2]}", e[0]]
    end
    self.add_field :person_id, "Administrado por", :select, {hide_index: true, options: employees_options}
    self.add_field :organization_id, "Organización", :select, { options: Organization.order(:name).pluck(:name, :id)}

    status_options = []
    status_options << ["Activo", Department::ACTIVE]
    status_options << ["Inactivo", Department::INACTIVE]
    self.add_field :status, "Estado", :select, { options: status_options}

    self.add_filter :select, [:organization_id], {options: Organization.order(:name).pluck(:name, :id) }
    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

  end

  def list
    @departments = Department.where(status: Department::ACTIVE).order(:name)

    render layout: 'org'
  end 

  def department_show
    @department = Department.find(params[:id])
    render layout: 'department'
  end

end