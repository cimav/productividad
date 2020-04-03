class EventOrganizersController < ApplicationController
  before_action :auth_required

  before_action :set_event_organizer, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /event_organizers
  # GET /event_organizers.json
  def index

    year = params[:year]
       
    @all_event_organizers = EventOrganizer.where("event_organizers.person_id = ?", @person.id)

    @event_organizers = @all_event_organizers

    if !year.blank?
      if year != 'todos'
        @event_organizers = @event_organizers.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @event_organizers = @event_organizers.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @event_organizers = @event_organizers.order(last_date: :desc)

    min_date = @all_event_organizers.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  # GET /event_organizers/1
  # GET /event_organizers/1.json
  def show
    render :layout => 'profile'
  end

  # GET /event_organizers/new
  def new
    @event_organizer = EventOrganizer.new
    render :layout => 'profile'
  end

  # GET /event_organizers/1/edit
  def edit
    render :layout => 'profile'
  end

  # POST /event_organizers
  # POST /event_organizers.json
  def create
    @event_organizer = EventOrganizer.new
    @event_organizer.organizer_type = params[:organizer_type]
    @event_organizer.activity  = params[:activity]
    @event_organizer.conference_id = params[:conference_id]
    @event_organizer.person_id  = current_user.id
    @event_organizer.status     = EventOrganizer::ACTIVE
    conference = Conference.find(params[:conference_id])
    @event_organizer.last_date  = conference.end_date

    if @event_organizer.save
      log = @event_organizer.activity_logs.new 
      log.message = "Organizador agregado"
      log.person_id = current_user.id
      log.save
      render json: @event_organizer
    end
  end

  # PATCH/PUT /event_organizers/1
  # PATCH/PUT /event_organizers/1.json
  def update
    respond_to do |format|

      if @event_organizer.update(event_organizer_params)
        changes = @event_organizer.changes
      
        @event_organizer.save

        log = @event_organizer.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Organizador #{@event_organizer.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_event_organizer_path(@person.shortname, @event_organizer.id), notice: 'Organizador ha sido actualizado' }
        format.json { render :show, status: :ok, location: @event_organizer }
      else
        format.html { render :edit }
        format.json { render json: @event_organizer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_organizers/1
  # DELETE /event_organizers/1.json
  def destroy
    @event_organizer.destroy
    respond_to do |format|
      format.html { redirect_to event_organizers_url, notice: 'Organizador ha sido eliminado.' }
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
    def set_event_organizer
      @event_organizer = EventOrganizer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_organizer_params
      params.require(:event_organizer).permit(:organizer_type, :activity, :conference_id,:person_id, :status)
    end
end




