class CountriesController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Países'
    @crud_layout = 'config'
    self.add_field(:code, "Código", :string)
    self.add_field(:name, "Nombre", :string, {default: ''})
    self.add_field :lat, "Latitud", :string, {hide_index: true}
    self.add_field :long, "Longitud", :string, {hide_index: true}

    self.add_filter :search, [:name], {placeholder: "Busqueda…"}
  end
end
