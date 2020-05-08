class RelevantActivitiesController < ApplicationController
  before_action :auth_required

  before_action :set_relevant_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  def index

    year = params[:year]
       
    @all_relevant_activities = RelevantActivity.where("relevant_activities.person_id = ?", @person.id)

    @relevant_activities = @all_relevant_activities

    if !year.blank?
      if year != 'todos'
        @relevant_activities = @relevant_activities.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @relevant_activities = @relevant_activities.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @relevant_activities = @relevant_activities.order(last_date: :desc)

    min_date = @all_relevant_activities.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
       
    @all_relevant_activities = RelevantActivity.all

    @relevant_activities = @all_relevant_activities

    if !year.blank?
      if year != 'todos'
        @relevant_activities = @relevant_activities.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @relevant_activities = @relevant_activities.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @relevant_activities = @relevant_activities.order(last_date: :desc)

    min_date = @all_relevant_activities.minimum(:last_date)
    
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
    @relevant_activity = RelevantActivity.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @relevant_activity = RelevantActivity.new
    @relevant_activity.name = params[:name]
    @relevant_activity.start_date  = params[:start_date]
    @relevant_activity.end_date = params[:end_date]
    @relevant_activity.location = params[:location]
    @relevant_activity.description = params[:description]
    @relevant_activity.country_id = params[:country_id]
    @relevant_activity.person_id  = current_user.id
    @relevant_activity.last_date = params[:end_date]

    if @relevant_activity.save
      log = @relevant_activity.activity_logs.new 
      log.message = "Difusión y Divulgación agregado"
      log.person_id = current_user.id
      log.save
      render json: @relevant_activity
    else 
       puts @relevant_activity.errors.full_messages
    end
  end

  def update
    respond_to do |format|

      if @relevant_activity.update(relevant_activity_params)
        changes = @relevant_activity.changes
        @relevant_activity.last_date = @relevant_activity.end_date
    
        @relevant_activity.save

        log = @relevant_activity.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Difusión y Divulgación #{@relevant_activity.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_relevant_activity_path(@person.shortname, @relevant_activity.id), notice: 'Difusión y Divulgación ha sido actualizado' }
        format.json { render :show, status: :ok, location: @relevant_activity }
      else
        format.html { render :edit }
        format.json { render json: @relevant_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @relevant_activity.destroy
    respond_to do |format|
      format.html { redirect_to relevant_activities_url, notice: 'Difusión y Divulgación ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_relevant_activity
      @relevant_activity = RelevantActivity.find(params[:id])
    end

    def relevant_activity_params
      params.require(:relevant_activity).permit(:name, :description, :start_date, :end_date, :location, :country_id, :person_id)
    end
end


