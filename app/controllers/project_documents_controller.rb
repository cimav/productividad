class ProjectDocumentsController < ApplicationController
  before_action :auth_required

  before_action :set_project
  before_action :set_project_document, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  # GET /projects
  # GET /projects.json
  def index
    @project_document = ProjectDocument.new
    @project_document.parent = -1
    render :layout => 'profile'
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  	if @project_document.status == ProjectDocument::DELETED
  	  redirect_to project_project_documents_path(@person.shortname, @project)
  	else
      render :layout => 'profile'
    end
  end

  # GET /projects/new
  def new
    @project_document = ProjectDocument.new
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
      @project_document = @project.project_documents.build(project_document_params)
      @project_document.person_id  = current_user.id
      @project_document.status     = ProjectDocument::ACTIVE

      if @project_document.save
        log = @project.activity_logs.new 
        log.document = "documento agregado #{@project_document.id}"
        log.person_id = current_user.id
        log.save
        format.html { redirect_to project_project_documents_path(@person.shortname, @project), notice: 'Documento publicado' }
        format.json { render :show, status: :ok, location: @project_document }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|

      if @project_document.update(project_document_params)
        changes = @project.changes
        @project.last_date = @project.start_date
      
        @project.save

        log = @project.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.document = "El documento ha sido actualizado."
        log.save
          
        format.html { redirect_to project_project_document_path(@person.shortname, @project, @project_document), notice: 'El documento ha sido actualizado' }
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
    @project_document.status = ProjectDocument::DELETED
    @project_document.save
    respond_to do |format|
      format.html { redirect_to project_project_documents_path(@person.shortname, @project), notice: 'El documento ha sido eliminado.' }
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

    def set_project_document
      @project_document = ProjectDocument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_document_params
      params.require(:project_document).permit(:name, :url, :parent, :content, :file_type, :file)
    end
end


