class CitiesController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Ciudades'
    @crud_layout = 'config'
    self.add_field :country_id, "País", :select, { options: Country.order(:name).pluck(:name, :id)}
    self.add_field :name, "Nombre", :string
    self.add_field :lat, "Latitud", :string, {hide_index: true}
    self.add_field :long, "Longitud", :string, {hide_index: true}
    
    self.add_filter :select, [:country_id], {options: Country.order(:name).pluck(:name, :id) }
    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

  end
end