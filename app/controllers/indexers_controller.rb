class IndexersController < ApplicationController
  before_action :set_indexer, only: [:show, :edit, :update, :destroy]

  # GET /indexers
  # GET /indexers.json
  def index
    @indexers = Indexer.all
  end

  # GET /indexers/1
  # GET /indexers/1.json
  def show
  end

  # GET /indexers/new
  def new
    @indexer = Indexer.new
  end

  # GET /indexers/1/edit
  def edit
  end

  # POST /indexers
  # POST /indexers.json
  def create
    @indexer = Indexer.new(indexer_params)

    respond_to do |format|
      if @indexer.save
        format.html { redirect_to indexers_url, notice: 'Índice creado.' }
        format.json { render :show, status: :created, location: @indexer }
      else
        format.html { render :new }
        format.json { render json: @indexer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indexers/1
  # PATCH/PUT /indexers/1.json
  def update
    respond_to do |format|
      if @indexer.update(indexer_params)
        format.html { redirect_to indexers_url, notice: 'Índice actualizado.' }
        format.json { render :show, status: :ok, location: @indexer }
      else
        format.html { render :edit }
        format.json { render json: @indexer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indexers/1
  # DELETE /indexers/1.json
  def destroy
    @indexer.destroy
    respond_to do |format|
      format.html { redirect_to indexers_url, notice: 'Índice eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indexer
      @indexer = Indexer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indexer_params
      params.require(:indexer).permit(:name, :website)
    end
end
