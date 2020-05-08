class InvitedConferencesController < ApplicationController
  before_action :auth_required

  before_action :set_invited_conference, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  def index

    year = params[:year]
       
    @all_invited_conferences = InvitedConference.where("invited_conferences.person_id = ?", @person.id)

    @invited_conferences = @all_invited_conferences

    if !year.blank?
      if year != 'todos'
        @invited_conferences = @invited_conferences.where("YEAR(last_date) = ?", year)
      end
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

  def org_index

    year = params[:year]
       
    @all_invited_conferences = InvitedConference.all

    @invited_conferences = @all_invited_conferences

    if !year.blank?
      if year != 'todos'
        @invited_conferences = @invited_conferences.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @invited_conferences = @invited_conferences.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @invited_conferences = @invited_conferences.order(last_date: :desc)

    min_date = @all_invited_conferences.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'org'
  end

  def show
    layout = 'org'
    if !@person.blank?
      layout = 'profile'
    end
    render :layout => layout
  end

  def new
    @invited_conference = InvitedConference.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

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

  def destroy
    @invited_conference.destroy
    respond_to do |format|
      format.html { redirect_to invited_conferences_url, notice: 'La invitación ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    def set_invited_conference
      @invited_conference = InvitedConference.find(params[:id])
    end

    def invited_conference_params
      params.require(:invited_conference).permit(:title, :conference_date, :conference_id,:person_id, :status)
    end
end



