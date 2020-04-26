class PeopleController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Personas'
    @crud_layout = 'config'
    self.add_field :first_name, "Nombre", :string
    self.add_field :last_name, "Apellidos", :string
    self.add_field :email, "Correo", :string
    self.add_field :description, "Descripción", :string, {hide_index: true}
    self.add_field :start_date, "Inicio", :string, {hide_index: true}
    self.add_field :end_date, "Fin", :string, {hide_index: true}
    self.add_field :status, "Estado", :string, {hide_index: true}
    self.add_field :organization_id, "Organización", :string, {hide_index: true}
    self.add_field :department_id, "Departamento", :string, {hide_index: true}
    self.add_field :person_id, "Reporta a", :string, {hide_index: true}
  end
end


