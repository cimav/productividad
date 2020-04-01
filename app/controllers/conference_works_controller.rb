class ConferenceWorksController < ApplicationController
  before_action :auth_required

  before_action :set_conference_work, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /conference_works
  # GET /conference_works.json
  def index

    year = params[:year]
 
    @filter_status = params[:status] 
    case @filter_status
      when "enviados"
        status = ConferenceWork::SENT
      when "aceptados"
        status = ConferenceWork::ACCEPTED
      when "publicados"
        status = ConferenceWork::PUBLISHED
      when "rechazados"
        status = ConferenceWork::REJECTED
      else
        @filter_status = 'todos'
    end
       
    @all_conference_works = ConferenceWork.left_outer_joins(:product_participants).where("(product_participants.person_id=? AND product_participants.status=?) OR (conference_works.person_id = ?)", @person.id, ProductParticipant::ACTIVE, @person.id).group('conference_works.id') 

    @conference_works = @all_conference_works


    if params[:status] == 'todos'
      if !year.blank?
        @conference_works = @conference_works.where("YEAR(last_date) = ?", year)
      end
    elsif !status.blank? && !year.blank?
      @conference_works = @conference_works.where("conference_works.status = ? AND YEAR(last_date) = ?", status, year)
    elsif !status.blank?
      @conference_works = @conference_works.where("conference_works.status = ?", status)
    else
      year = Date.today.year
      @conference_works = @conference_works.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @conference_works = @conference_works.order(last_date: :desc)

    min_date = @all_conference_works.minimum(:last_date)
    
    @min_year = min_date.year rescue year
    puts "AÑO #{@min_year}"

    render :layout => 'profile'
  end

  # GET /conference_works/1
  # GET /conference_works/1.json
  def show
    render :layout => 'profile'
  end

  # GET /conference_works/new
  def new
    @conference_work = ConferenceWork.new
    render :layout => 'profile'
  end

  # GET /conference_works/1/edit
  def edit
    render :layout => 'profile'
  end

  # POST /conference_works
  # POST /conference_works.json
  def create
    @conference_work = ConferenceWork.new
    @conference_work.title      = params[:title]
    @conference_work.sent_date  = params[:sent_date]
    @conference_work.authors    = params[:authors]
    @conference_work.conference_id = params[:conference_id]
    @conference_work.work_type = params[:work_type]
    @conference_work.person_id  = current_user.id
    @conference_work.status     = ConferenceWork::SENT
    @conference_work.last_date  = @conference_work.sent_date

    if @conference_work.save
      authors = @conference_work.authors 
      authors_array = authors.split(',')
      c = 0
      authors_array.each do |author| 
        c = c + 1
        author_sanitized = author.remove('and').strip
        p = @conference_work.product_participants.new
        p.author_is = author_sanitized
        p.participation = ProductParticipant::PARTICIPANT
        if c == 1
          p.participation = ProductParticipant::FIRST_AUTHOR
        end 

        if c == authors_array.count
          p.participation = ProductParticipant::CORRESPONDING
        end 
      
        pp = ProductParticipant.where(author_is: author_sanitized)
        if pp.count > 0
          ppp = pp.last!
          p.person_id = ppp.person_id
        end 
        p.status = ProductParticipant::UNASSIGNED
        p.save
      end
      log = @conference_work.activity_logs.new 
      log.message = "Trabajo agregado: #{@conference_work.title}"
      log.person_id = current_user.id
      log.save
      render json: @conference_work
    end
  end

  # PATCH/PUT /conference_works/1
  # PATCH/PUT /conference_works/1.json
  def update
    respond_to do |format|

      if @conference_work.update(conference_work_params)
        changes = @conference_work.changes
        if @conference_work.status == ConferenceWork::SENT
          @conference_work.last_date = @conference_work.sent_date
        elsif @conference_work.status == ConferenceWork::ACCEPTED
          @conference_work.last_date = @conference_work.accepted_date
        elsif @conference_work.status == ConferenceWork::PUBLISHED
          @conference_work.last_date = @conference_work.published_date
        elsif @conference_work.status == ConferenceWork::REJECTED
          @conference_work.last_date = @conference_work.rejected_date
        end
      
        @conference_work.save

        log = @conference_work.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El Trabajo #{@conference_work.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_conference_work_path(@person.shortname, @conference_work.id), notice: 'El Trabajo ha sido actualizado' }
        format.json { render :show, status: :ok, location: @conference_work }
      else
        format.html { render :edit }
        format.json { render json: @conference_work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conference_works/1
  # DELETE /conference_works/1.json
  def destroy
    @conference_work.destroy
    respond_to do |format|
      format.html { redirect_to conference_works_url, notice: 'El Trabajo ha sido eliminado.' }
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
    def set_conference_work
      @conference_work = ConferenceWork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_work_params
      params.require(:conference_work).permit(:title, :sent_date, :accepted_date, :published_date, :conference_id, :authors, :work_type, :person_id, :status)
    end
end


