class ProjectsController < ApplicationController
  before_action :auth_required

  before_action :set_project, only: [:org_show, :information, :change_status, :change_status_save, :admin, :show, :edit, :update, :destroy, :budget, :messages, :tasks, :calendar, :services, :participants, :documents]
  before_action :set_person
  before_action :set_department


  # GET /projects
  # GET /projects.json
  def index

    year = params[:year]
 
    @filter_status = params[:status] 

    case @filter_status
      when "en-definicion"
        status = Project::DEFINITION
      when "en-negociacion"
        status = Project::NEGOTIATION
      when "en-proceso"
        status = Project::IN_PROCESS
      when "concluidos"
        status = Project::CONCLUDED
      when "suspendidos"
        status = Project::SUSPENDED
      when "cancelados"
        status = Project::CANCELED
      when "rechazados"
        status = Project::REJECTED
      else
        @filter_status = 'todos'
    end
      
    @all_projects = Project.left_outer_joins(:project_participants).where("(project_participants.person_id=? AND project_participants.status=?) OR (projects.person_id = ?)", @person.id, ProjectParticipant::ACTIVE, @person.id).group('projects.id') 

    @projects = @all_projects


    if params[:status] == 'todos'
      if !year.blank?
        @projects = @projects.where("YEAR(last_date) <= ?", year)
      end
    elsif !status.blank? && !year.blank?
      @projects = @projects.where("projects.status = ? AND YEAR(last_date) <= ?", status, year)
    elsif !status.blank?
      @projects = @projects.where("projects.status = ?", status)
    else
      year = Date.today.year
      @projects = @projects.where("YEAR(last_date) <= ?", year)
    end

    @filter_year = year

    @projects = @projects.order(last_date: :desc)

    min_date = @all_projects.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
    @filter_status = params[:status] 
    case @filter_status
      when "en-definicion"
        status = Project::DEFINITION
      when "en-negociacion"
        status = Project::NEGOTIATION
      when "en-proceso"
        status = Project::IN_PROCESS
      when "concluidos"
        status = Project::CONCLUDED
      when "suspendidos"
        status = Project::SUSPENDED
      when "cancelados"
        status = Project::CANCELED
      when "rechazados"
        status = Project::REJECTED
      else
        @filter_status = 'todos'
    end
    #@all_projects = Project.left_outer_joins(:project_participants).where("(project_participants.person_id=? AND project_participants.status=?) OR (projects.person_id = ?)", @person.id, ProjectParticipant::ACTIVE, @person.id).group('projects.id') 
    @all_projects = Project.all
    @projects = @all_projects
    if params[:status] == 'todos'
      if !year.blank?
        @projects = @projects.where("YEAR(last_date) <= ?", year)
      end
    elsif !status.blank? && !year.blank?
      @projects = @projects.where("projects.status = ? AND YEAR(last_date) <= ?", status, year)
    elsif !status.blank?
      @projects = @projects.where("projects.status = ?", status)
    else
      year = Date.today.year
      @projects = @projects.where("YEAR(last_date) <= ?", year)
    end
    @filter_year = year
    @projects = @projects.order(last_date: :desc)
    min_date = @all_projects.minimum(:last_date)
    @min_year = min_date.year rescue year
    render :layout => 'org'
  end

  def department_index

    year = params[:year]
    @filter_status = params[:status] 
    case @filter_status
      when "en-definicion"
        status = Project::DEFINITION
      when "en-negociacion"
        status = Project::NEGOTIATION
      when "en-proceso"
        status = Project::IN_PROCESS
      when "concluidos"
        status = Project::CONCLUDED
      when "suspendidos"
        status = Project::SUSPENDED
      when "cancelados"
        status = Project::CANCELED
      when "rechazados"
        status = Project::REJECTED
      else
        @filter_status = 'todos'
    end
    # @all_projects = Project.left_outer_joins(:product_participants).where("(product_participants.person_id=? AND product_participants.status=?) OR (projects.person_id = ?)", @person.id, ProductParticipant::ACTIVE, @person.id).group('projects.id') 
    @all_projects = Project.all
    @projects = @all_projects
    if params[:status] == 'todos'
      if !year.blank?
        @projects = @projects.where("YEAR(last_date) <= ?", year)
      end
    elsif !status.blank? && !year.blank?
      @projects = @projects.where("projects.status = ? AND YEAR(last_date) <= ?", status, year)
    elsif !status.blank?
      @projects = @projects.where("projects.status = ?", status)
    else
      year = Date.today.year
      @projects = @projects.where("YEAR(last_date) <= ?", year)
    end
    @filter_year = year
    @projects = @projects.order(last_date: :desc)
    min_date = @all_projects.minimum(:last_date)
    @min_year = min_date.year rescue year
    render :layout => 'department'
  end

  def admin 
    render :layout => 'profile'
  end

  def information 
    render :layout => 'profile'
  end

  def budget 
    render :layout => 'profile'
  end

  def services 
    render :layout => 'profile'
  end


  def change_status
    @project_status_change = @project.project_status_changes.new
    render :layout => 'profile'
  end

  def change_status_save
    @project_status_change = @project.project_status_changes.new(project_status_change_params)
    @project_status_change.from = @project.status
    @project_status_change.person_id = current_user.id
    @project_status_change.status = ProjectStatusChange::ACTIVE
    if @project_status_change.save 
      @project.status = @project_status_change.to
      @project.save
      redirect_to administrar_informacion_project_path(@person.shortname, @project.id), notice: "El proyecto cambio de estado a #{@project.status_text}"
    end
  end


  def show
    layout = 'org'
    if !@department.blank?
      layout = 'department'
    elsif !@person.blank?
      layout = 'profile'
    end
    render :layout => layout
  end

  def new
    @project = Project.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @project = Project.new

    @project.name      = params[:name]
    @project.start_date  = params[:start_date]
    @project.source_type    = params[:source_type]
    @project.source = params[:source]
    @project.research_type = params[:research_type]
    @project.person_id  = current_user.id
    @project.status     = Project::DEFINITION
    @project.last_date = @project.start_date

    if @project.save
      leader = @project.project_participants.new
      leader.person_id = current_user.id
      leader.participation = 100
      leader.role_type = ProjectParticipant::LEADER
      leader.role = "Lider del proyecto"
      leader.save

      status_definition = @project.project_status_changes.new
      status_definition.from = Project::DEFINITION
      status_definition.to = Project::DEFINITION
      status_definition.change_date = @project.start_date
      status_definition.person_id = current_user.id
      status_definition.status = ProjectStatusChange::ACTIVE
      status_definition.save


      log = @project.activity_logs.new 
      log.message = "Proyecto agregado: #{@project.name}"
      log.person_id = current_user.id
      log.save
      render json: @project
    end
  end

  def update
    respond_to do |format|

      if @project.update(project_params)
        changes = @project.changes
        @project.last_date = @project.start_date
        if !@project.end_date.blank?
          @project.last_date = @project.end_date
        end
      
        @project.save

        log = @project.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El proyecto #{@project.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to administrar_informacion_project_path(@person.shortname, @project.id), notice: 'El proyecto ha sido actualizado' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'El proyecto ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :external_identificator, :internal_identificator, :source_type, :source, :objectives, :results, :research_type, :start_date, :end_date, :extension_date, :last_date, :status)
    end

    def project_status_change_params
      params.require(:project_status_change).permit(:change_date, :content, :to, :status)
    end
end
