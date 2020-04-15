class AssociationsController < ApplicationController
  before_action :set_association, only: [:show, :edit, :update, :destroy]

  # GET /associations
  # GET /associations.json
  def index
    @associations = Association.all
  end

  def search 
    @associations = Association.where("name LIKE :query", query: "%#{params[:q]}%")
    render layout: false
  end

  def data 
    @association = Association.find(params[:id])
    render layout: false
  end

  def new_association
    @association = Association.new
    render layout: false
  end

  def add_association
    @association = Association.new
    @association.name = params[:name]
    @association.country_id   = params[:country_id]
    @association.validated    = association::NOT_VALIDATED
    @association.submitted_by = current_user.id

    if @association.save! 
      render json: @association
    end
  end

  # GET /associations/1
  # GET /associations/1.json
  def show
  end

  # GET /associations/new
  def new
    @association = Association.new
  end

  # GET /associations/1/edit
  def edit
  end

  # POST /associations
  # POST /associations.json
  def create
    @association = Association.new(association_params)
    @association.status = Association::ACTIVE

    respond_to do |format|
      if @association.save
        format.html { redirect_to @association, notice: 'Asociación creada.' }
        format.json { render :show, status: :created, location: @association }
      else
        format.html { render :new }
        format.json { render json: @association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associations/1
  # PATCH/PUT /associations/1.json
  def update
    respond_to do |format|
      if @association.update(association_params)
        if params[:indexer] 
          @association.association_indices.delete_all
          params[:indexer].each do |idx|
            association_index = @association.association_indices.new
            association_index.indexer_id = idx
            association_index.save
          end
        end
        format.html { redirect_to @association, notice: 'Asociación actualizada.' }
        format.json { render :show, status: :ok, location: @association }
      else
        format.html { render :edit }
        format.json { render json: @association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associations/1
  # DELETE /associations/1.json
  def destroy
    @association.destroy
    respond_to do |format|
      format.html { redirect_to associations_url, notice: 'Asociación eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association
      @association = Association.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def association_params
      params.require(:association).permit(:name, :website, :is_international, :location, :status, :country_id)
    end
end

