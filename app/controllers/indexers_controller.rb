class IndexersController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Índices'
    @crud_layout = 'config'
    self.add_field :name, "Nombre", :string
    self.add_field :website, "Sitio Web", :string

    self.add_filter :search, [:name, :website], {placeholder: "Busqueda…"}
  end
end