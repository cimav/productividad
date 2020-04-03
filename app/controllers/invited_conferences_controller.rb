class InvitedConferencesController < ApplicationController
  before_action :auth_required

  before_action :set_invited_conference, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /invited_conferences
  # GET /invited_conferences.json
  def index

    year = params[:year]
       
    @all_invited_conferences = InvitedConference.where("invited_conferences.person_id = ?", @person.id)

    @invited_conferences = @all_invited_conferences

    if !year.blank?
      @invited_conferences = @invited_conferences.where("YEAR(last_date) = ?", year)
    else
      year = Date.today.year
      @invited_conferences = @invited_conferences.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @invited_conferences = @invited_conferences.order(last_date: :desc)

    min_date = @all_invited_conferences.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  # GET /invited_conferences/1
  # GET /invited_conferences/1.json
  def show
    render :layout => 'profile'
  end

  # GET /invited_conferences/new
  def new
    @invited_conference = InvitedConference.new
    render :layout => 'profile'
  end

  # GET /invited_conferences/1/edit
  def edit
    render :layout => 'profile'
  end

  # POST /invited_conferences
  # POST /invited_conferences.json
  def create
    @invited_conference = InvitedConference.new
    @invited_conference.title      = params[:title]
    @invited_conference.conference_date  = params[:conference_date]
    @invited_conference.conference_id = params[:conference_id]
    @invited_conference.person_id  = current_user.id
    @invited_conference.status     = InvitedConference::PRESENTATION
    @invited_conference.last_date  = @invited_conference.conference_date

    if @invited_conference.save
      log = @invited_conference.activity_logs.new 
      log.message = "Conferencia por invitación agregada: #{@invited_conference.title}"
      log.person_id = current_user.id
      log.save
      render json: @invited_conference
    end
  end

  # PATCH/PUT /invited_conferences/1
  # PATCH/PUT /invited_conferences/1.json
  def update
    respond_to do |format|

      if @invited_conference.update(invited_conference_params)
        changes = @invited_conference.changes
      
        @invited_conference.save

        log = @invited_conference.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "La invitación #{@invited_conference.id} ha sido actualizada."
        log.save
          
        format.html { redirect_to edit_invited_conference_path(@person.shortname, @invited_conference.id), notice: 'La invitación ha sido actualizada' }
        format.json { render :show, status: :ok, location: @invited_conference }
      else
        format.html { render :edit }
        format.json { render json: @invited_conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invited_conferences/1
  # DELETE /invited_conferences/1.json
  def destroy
    @invited_conference.destroy
    respond_to do |format|
      format.html { redirect_to invited_conferences_url, notice: 'La invitación ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    def set_person
      email = params[:email]
      if !email.include? '@'
        email += '@' + main_organization.domain
      end
      @person = Person.find_by_email(email)

      if (!@person) 
        redirect_to profiles_url
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_invited_conference
      @invited_conference = InvitedConference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invited_conference_params
      params.require(:invited_conference).permit(:title, :conference_date, :conference_id,:person_id, :status)
    end
end



