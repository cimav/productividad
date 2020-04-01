class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]

  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = Conference.all
  end

  def search 
    @conferences = Conference.where("name LIKE :query", query: "%#{params[:q]}%")
    render layout: false
  end

  def data 
    @conference = Conference.find(params[:id])
    render layout: false
  end

  def new_conference
    @conference = Conference.new
    render layout: false
  end

  def add_conference
    @conference = Conference.new
    @conference.name = params[:name]
    @conference.country_id   = params[:country_id]
    @conference.validated    = Conference::NOT_VALIDATED
    @conference.submitted_by = current_user.id

    if @conference.save! 
      render json: @conference
    end
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)

    respond_to do |format|
      if @conference.save
        format.html { redirect_to @conference, notice: 'conference was successfully created.' }
        format.json { render :show, status: :created, location: @conference }
      else
        format.html { render :new }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
  def update
    respond_to do |format|
      if @conference.update(conference_params)
        format.html { redirect_to @conference, notice: 'conference was successfully updated.' }
        format.json { render :show, status: :ok, location: @conference }
      else
        format.html { render :edit }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to conferences_url, notice: 'conference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:name, :is_refereed, :is_international, :place, :start_date, :end_date, :organizer, :status, :country_id)
    end
end

