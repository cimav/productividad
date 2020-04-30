class DepartmentsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Departamentos'
    @crud_layout = 'config'
    self.add_field :name, "Nombre", :string
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