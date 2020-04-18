class ProjectParticipantsController < ApplicationController
  before_action :auth_required

  before_action :set_project
  before_action :set_project_participant, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def percentages
  	render :layout => 'profile'
  end

  def percentages_save
  	params.each do |k,v|
  	  if k.starts_with?("percentage-")
        id = "#{k}"
        id['percentage-'] = ''
        p = ProjectParticipant.find(id)
        p.participation = v.to_i
        p.save 
  	  end
  	end
  	redirect_to project_project_participants_path(@person.shortname, @project)
  end


  # GET /projects
  # GET /projects.json
  def index
    render :layout => 'profile'
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  	if @project_participant.status == ProjectParticipant::DELETED
  	  redirect_to project_project_participants_path(@person.shortname, @project)
  	else
      render :layout => 'profile'
    end
  end

  # GET /projects/new
  def new
    @project_participant = ProjectParticipant.new
    render :layout => 'profile'
  end

  # GET /projects/1/edit
  def edit
    render :layout => 'profile'
  end

  # POST /projects
  # POST /projects.json
  def create
    respond_to do |format|
      @project_participant = @project.project_participants.build(project_participant_params)
      @project_participant.status = ProjectParticipant::ACTIVE
      @project_participant.person_id = params[:person_id]
      @project_participant.participation = 0

      if @project_participant.save
        log = @project.activity_logs.new 
        log.message = "Participante agregado #{@project_participant.id}"
        log.person_id = current_user.id
        log.save
        format.html { redirect_to project_project_participants_path(@person.shortname, @project), notice: 'participante publicado' }
        format.json { render :show, status: :ok, location: @project_participant }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|

      if @project_participant.update(project_participant_params)
        changes = @project.changes
        @project.last_date = @project.start_date
      
        @project.save

        log = @project.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El participante ha sido actualizado."
        log.save
          
        format.html { redirect_to project_project_participants_path(@person.shortname, @project), notice: 'El participante ha sido actualizado' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project_participant.status = ProjectParticipant::DELETED
    @project_participant.save
    respond_to do |format|
      format.html { redirect_to project_project_participants_path(@person.shortname, @project), notice: 'El participante ha sido eliminado.' }
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
        #redirect_to profiles_url
        puts "REDIRECT"
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_project_participant
      @project_participant = ProjectParticipant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_participant_params
      params.require(:project_participant).permit(:role, :participation, :role_type, :participant_type)
    end
end

