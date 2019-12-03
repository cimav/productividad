class JournalImpactFactorsController < ApplicationController
  before_action :set_journal_impact_factor, only: [:show, :edit, :update, :destroy]
  before_action :set_journal, only: [:new, :create, :show, :edit, :update, :destroy, :index]


  # GET /journal_impact_factors
  # GET /journal_impact_factors.json
  def index
    puts "AQUI ESTA"
    @journal_impact_factors = @journal.journal_impact_factors.order(year: :desc)
  end

  # GET /journal_impact_factors/1
  # GET /journal_impact_factors/1.json
  def show
  end

  # GET /journal_impact_factors/new
  def new
    @journal_impact_factor = @journal.journal_impact_factors.new
  end

  # GET /journal_impact_factors/1/edit
  def edit
  end

  # POST /journal_impact_factors
  # POST /journal_impact_factors.json
  def create
    @journal_impact_factor = @journal.journal_impact_factors.new(journal_impact_factor_params)

    respond_to do |format|
      if @journal_impact_factor.save
        format.html { redirect_to journal_journal_impact_factors_path(@journal), notice: 'Factor de impacto creado.' }
        format.json { render :show, status: :created, location: @journal_impact_factor }
      else

        format.html { render :new }
        format.json { render json: @journal_impact_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journal_impact_factors/1
  # PATCH/PUT /journal_impact_factors/1.json
  def update
    respond_to do |format|
      if @journal_impact_factor.update(journal_impact_factor_params)
        format.html { redirect_to journal_journal_impact_factors_path(@journal), notice: 'Factor de impacto actualizado.' }
        format.json { render :show, status: :ok, location: @journal_impact_factor }
      else
        format.html { render :edit }
        format.json { render json: @journal_impact_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_impact_factors/1
  # DELETE /journal_impact_factors/1.json
  def destroy
    @journal_impact_factor.destroy
    respond_to do |format|
      format.html { redirect_to journal_journal_impact_factors_path(@journal), notice: 'Factor de impacto eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      @journal = Journal.find(params[:journal_id])
      puts "SI PASO POR AQUI"
    end

    def set_journal_impact_factor
      @journal_impact_factor = JournalImpactFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_impact_factor_params
      params.require(:journal_impact_factor).permit(:journal_id, :year, :impact_factor)
    end
end
