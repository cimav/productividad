class ProjectTasksController < ApplicationController
  before_action :auth_required

  before_action :set_project
  before_action :set_project_task, only: [:mark, :show, :edit, :update, :destroy]
  before_action :set_person


  # GET /projects
  # GET /projects.json
  def index
    render :layout => 'profile'
  end

  def new_list
  	#@project_task_list = @project.project_task_lists.new
    @project_task_list = ProjectTaskList.new
  	render :layout => 'profile'
  end

  def new_list_save
  	respond_to do |format|
      @project_task_list = @project.project_task_lists.build(project_task_list_params)
      @project_task_list.person_id  = current_user.id
      @project_task_list.status     = ProjectTask::ACTIVE

      if @project_task_list.save
        log = @project.activity_logs.new 
        log.message = "Lista creada  #{@project_task_list.id}"
        log.person_id = current_user.id
        log.save
        format.html { redirect_to project_project_tasks_path(@person.shortname, @project), notice: 'Nueva lista creada' }
        format.json { render :show, status: :ok, location: @project_task }
      end
    end
  	
  end

  def mark 
    if @project_task.done == ProjectTask::NOT_DONE
      @project_task.done = ProjectTask::DONE
      @project_task.done_date = Date.today
      msg = "Tarea realizada"
    else
      @project_task.done = ProjectTask::NOT_DONE
      @project_task.done_date = nil
      msg = "Tarea no realizada"
    end
    
    if @project_task.save
      json = {}
      json[:id] = @project_task.id
      json[:message] = msg
      render :json => json
    else
      flash[:error] = 'No se pudo actualizar la tarea'
      json = {}
      json[:flash] = flash
      json[:errors] = @project_task.errors
      render :json => json, :status => :unprocessable_entity
    end

  end

  def task_lists
    render :layout => false
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  	if @project_task.status == ProjectTask::DELETED
  	  redirect_to project_project_tasks_path(@person.shortname, @project)
  	else
      render :layout => 'profile'
    end
  end

  # GET /projects/new
  def new
    @project_task = ProjectTask.new
    @project_task.project_task_list_id = params[:list]
    @project_task.assigned_to = current_user.id
    @project_task.done == ProjectTask::NOT_DONE
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
  	  @project_task_list = ProjectTaskList.find(project_task_params[:project_task_list_id])
      @project_task = @project_task_list.project_tasks.build(project_task_params)
      @project_task.person_id  = current_user.id
      @project_task.status     = ProjectTask::ACTIVE

      if @project_task.save
        log = @project.activity_logs.new 
        log.message = "Tarea agregada #{@project_task.id}"
        log.person_id = current_user.id
        log.save
        format.html { redirect_to project_project_tasks_path(@person.shortname, @project), notice: 'Tarea creada' }
        format.json { render :show, status: :ok, location: @project_task }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|

      if @project_task.update(project_task_params)
        changes = @project.changes
        @project.last_date = @project.start_date
      
        @project.save

        log = @project.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "La tarea ha sido actualizada."
        log.save
          
        format.html { redirect_to project_project_task_path(@person.shortname, @project, @project_task), notice: 'La tarea ha sido actualizada' }
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
    @project_task.status = ProjectTask::DELETED
    @project_task.save
    respond_to do |format|
      format.html { redirect_to project_project_tasks_path(@person.shortname, @project), notice: 'La tarea ha sido eliminada.' }
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

    def set_project_task
      @project_task = ProjectTask.find(params[:id])
    end

    def project_task_list_params
      params.require(:project_task_list).permit(:name, :content, :position)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_task_params
      params.require(:project_task).permit(:name, :content, :position, :project_task_list_id, :assigned_to)
    end
end


