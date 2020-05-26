class JournalCategoriesController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Categorías de Revistas'
    @crud_container = 'crud-container'
    @crud_layout = 'config'
    @crud_item_title = :name 
    self.add_field :name, "Nombre", :string
    self.add_filter :search, [:name], {placeholder: "Busqueda…"}
  end
end