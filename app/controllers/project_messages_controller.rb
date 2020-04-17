class ProjectMessagesController < ApplicationController
  before_action :auth_required

  before_action :set_project
  before_action :set_project_message, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /projects
  # GET /projects.json
  def index
    render :layout => 'profile'
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  	if @project_message.status == ProjectMessage::DELETED
  	  redirect_to project_project_messages_path(@person.shortname, @project)
  	else
      render :layout => 'profile'
    end
  end

  # GET /projects/new
  def new
    @project_message = ProjectMessage.new
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
      @project_message = @project.project_messages.build(project_message_params)
      @project_message.person_id  = current_user.id
      @project_message.status     = ProjectMessage::ACTIVE

      if @project_message.save
        log = @project.activity_logs.new 
        log.message = "Mensaje agregado #{@project_message.id}"
        log.person_id = current_user.id
        log.save
        format.html { redirect_to project_project_messages_path(@person.shortname, @project), notice: 'Mensaje publicado' }
        format.json { render :show, status: :ok, location: @project_message }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|

      if @project_message.update(project_message_params)
        changes = @project.changes
        @project.last_date = @project.start_date
      
        @project.save

        log = @project.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El mensaje ha sido actualizado."
        log.save
          
        format.html { redirect_to project_project_message_path(@person.shortname, @project, @project_message), notice: 'El mensaje ha sido actualizado' }
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
    @project_message.status = ProjectMessage::DELETED
    @project_message.save
    respond_to do |format|
      format.html { redirect_to project_project_messages_path(@person.shortname, @project), notice: 'El mensaje ha sido eliminado.' }
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

    def set_project_message
      @project_message = ProjectMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_message_params
      params.require(:project_message).permit(:title, :content)
    end
end

