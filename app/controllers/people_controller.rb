class PeopleController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Personas'
    @crud_layout = 'config'
    @crud_item_image = :display_url
    @crud_item_title = :first_name
    self.add_field :person_type_id, "Tipo", :select, {options: PersonType.order(:name).pluck(:name, :id) }
    self.add_field :first_name, "Nombre", :string
    self.add_field :last_name, "Apellidos", :string
    self.add_field :email, "Correo", :string
    self.add_field :description, "Descripción", :string, {hide_index: true}
    self.add_field :start_date, "Inicio", :string, {hide_index: true}
    self.add_field :end_date, "Fin", :string, {hide_index: true}
    self.add_field :organization_id, "Organización", :select, {hide_index: true, options: Organization.order(:name).pluck(:name, :id)}
    self.add_field :department_id, "Departamento", :select, {hide_index: true, options: Department.order(:name).pluck(:name, :id)}

    employees_options = []
    employees = Person.where(person_type_id: 1).order(:first_name, :last_name).pluck(:id, :first_name, :last_name)
    employees.each do |e|
      employees_options << ["#{e[1]} #{e[2]}", e[0]]
    end
    self.add_field :person_id, "Reporta a", :select, {hide_index: true, options: employees_options}

    status_options = []
    status_options << ["Activo", Person::STATUS_ACTIVE]
    status_options << ["Baja", Person::STATUS_INACTIVE]
    self.add_field :status, "Estado", :select, {hide_index: true, options: status_options}

    self.add_filter :select, [:person_type_id], {options: PersonType.order(:name).pluck(:name, :id) }
    self.add_filter :search, [:first_name, :last_name, :email], {placeholder: "Busqueda…"}

  end
end


