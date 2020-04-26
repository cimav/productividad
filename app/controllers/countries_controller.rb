class CountriesController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Países'
    @crud_layout = 'config'
    self.add_field(:code, "Código", :string)
    self.add_field(:name, "Nombre", :string, {default: ''})
  end
end
