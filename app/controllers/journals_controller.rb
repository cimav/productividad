class JournalsController < SimpleCrudController
  def initialize
    super
    @crud_title = 'Revistas'
    @crud_container = 'crud-container'
    @crud_item_title = :name 
    self.add_field :name, "Nombre", :string
    self.add_field :website, "Sitio Web", :string
    self.add_field :country_id, "País", :select, { options: Country.order(:name).pluck(:name, :id)}
    self.add_field :issn, "ISSN", :string
    self.add_field :e_issn, "E-ISSN", :string
    self.add_field :impact_factor_with_year, "Factor de Impacto", :show
    self.add_field :is_refereed, "Arbitrada", :checkbox
    self.add_field :is_international, "Internacional", :checkbox
    self.add_field :is_indexed, "Indizada", :checkbox

    validated_options = []
    validated_options << ["Validada", Journal::VALIDATED]
    validated_options << ["No validada", Journal::NOT_VALIDATED]
    self.add_field :validated, "Estado", :select, { options: validated_options}

    self.add_filter :search, [:name], {placeholder: "Busqueda…"}

    self.add_child :journal_impact_factor, "Factores de Impacto"
  end

  def search 
    @journals = Journal.where("name LIKE :query", query: "%#{params[:q]}%")
    render layout: false
  end

  def data 
    @journal = Journal.find(params[:id])
    render layout: false
  end

  def new_journal
    @journal = Journal.new
    render layout: false
  end

  def add_journal
    @journal = Journal.new
    @journal.name = params[:name]
    @journal.country_id   = params[:country_id]
    @journal.validated    = Journal::NOT_VALIDATED
    @journal.submitted_by = current_user.id

    if @journal.save! 
      render json: @journal
    end
  end

end
