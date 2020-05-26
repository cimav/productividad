class JournalJournalCategoriesController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Categorías'
    @crud_container = 'crud-container'
    @crud_parent = :journal
    @crud_parent_title = :name
    # @crud_item_title = :name
    self.add_field :journal_category_id, "Categoría", :select, { options: JournalCategory.order(:name).pluck(:name, :id)}
  end
end