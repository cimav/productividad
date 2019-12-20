class ResearchSubGroupsController < ApplicationController
  before_action :set_research_sub_group, only: [:show, :edit, :update, :destroy]

  # GET /research_sub_groups
  # GET /research_sub_groups.json
  def index
    @research_sub_groups = ResearchSubGroup.all
  end

  # GET /research_sub_groups/1
  # GET /research_sub_groups/1.json
  def show
  end

  # GET /research_sub_groups/new
  def new
    @research_sub_group = ResearchSubGroup.new
  end

  # GET /research_sub_groups/1/edit
  def edit
  end

  # POST /research_sub_groups
  # POST /research_sub_groups.json
  def create
    @research_sub_group = ResearchSubGroup.new(research_sub_group_params)

    respond_to do |format|
      if @research_sub_group.save
        format.html { redirect_to research_sub_groups_url, notice: 'Sub Grupo creado.' }
        format.json { render :show, status: :created, location: @research_sub_group }
      else
        format.html { render :new }
        format.json { render json: @research_sub_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /research_sub_groups/1
  # PATCH/PUT /research_sub_groups/1.json
  def update
    respond_to do |format|
      if @research_sub_group.update(research_sub_group_params)
        format.html { redirect_to research_sub_groups_url, notice: 'Sub Grupo actualizado.' }
        format.json { render :show, status: :ok, location: @research_sub_group }
      else
        format.html { render :edit }
        format.json { render json: @research_sub_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /research_sub_groups/1
  # DELETE /research_sub_groups/1.json
  def destroy
    @research_sub_group.destroy
    respond_to do |format|
      format.html { redirect_to research_sub_groups_url, notice: 'Sub Grupo eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_sub_group
      @research_sub_group = ResearchSubGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def research_sub_group_params
      params.require(:research_sub_group).permit(:name, :description, :research_group_id)
    end
end


