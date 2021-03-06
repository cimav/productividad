class ProjectReviewersController < ApplicationController
  before_action :auth_required

  before_action :set_project_reviewer, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  def index

    year = params[:year]
       
    @all_project_reviewers = ProjectReviewer.where("project_reviewers.person_id = ?", @person.id)

    @project_reviewers = @all_project_reviewers

    if !year.blank?
      if year != 'todos'
        @project_reviewers = @project_reviewers.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @project_reviewers = @project_reviewers.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @project_reviewers = @project_reviewers.order(last_date: :desc)

    min_date = @all_project_reviewers.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
       
    @all_project_reviewers = ProjectReviewer.all

    @project_reviewers = @all_project_reviewers

    if !year.blank?
      if year != 'todos'
        @project_reviewers = @project_reviewers.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @project_reviewers = @project_reviewers.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @project_reviewers = @project_reviewers.order(last_date: :desc)

    min_date = @all_project_reviewers.minimum(:last_date)
    
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
    @project_reviewer = ProjectReviewer.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @project_reviewer = ProjectReviewer.new
    @project_reviewer.name = params[:name]
    @project_reviewer.announcement  = params[:announcement]
    @project_reviewer.description  = params[:description]
    @project_reviewer.review_date = params[:review_date]
    @project_reviewer.country_id = params[:country_id]
    @project_reviewer.person_id  = current_user.id
    @project_reviewer.last_date = params[:review_date]

    if @project_reviewer.save
      log = @project_reviewer.activity_logs.new 
      log.message = "Evaluador de proyecto agregado"
      log.person_id = current_user.id
      log.save
      render json: @project_reviewer
    else 
       puts @project_reviewer.errors.full_messages
    end
  end

  def update
    respond_to do |format|

      if @project_reviewer.update(project_reviewer_params)
        changes = @project_reviewer.changes
        @project_reviewer.last_date = @project_reviewer.review_date
    
        @project_reviewer.save

        log = @project_reviewer.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Evaluador de proyecto #{@project_reviewer.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_project_reviewer_path(@person.shortname, @project_reviewer.id), notice: 'Evaluador de proyecto ha sido actualizado' }
        format.json { render :show, status: :ok, location: @project_reviewer }
      else
        format.html { render :edit }
        format.json { render json: @project_reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project_reviewer.destroy
    respond_to do |format|
      format.html { redirect_to project_reviewers_url, notice: 'Evaluador de proyecto ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project_reviewer
      @project_reviewer = ProjectReviewer.find(params[:id])
    end

    def project_reviewer_params
      params.require(:project_reviewer).permit(:name, :announcement, :description, :review_date, :country_id, :person_id, :status)
    end
end

