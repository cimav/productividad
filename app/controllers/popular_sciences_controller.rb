class PopularSciencesController < ApplicationController
  before_action :auth_required

  before_action :set_popular_science, only: [:show, :edit, :update, :destroy]
  before_action :set_person


  def index

    year = params[:year]
       
    @all_popular_sciences = PopularScience.where("popular_sciences.person_id = ?", @person.id)

    @popular_sciences = @all_popular_sciences

    if !year.blank?
      if year != 'todos'
        @popular_sciences = @popular_sciences.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @popular_sciences = @popular_sciences.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @popular_sciences = @popular_sciences.order(last_date: :desc)

    min_date = @all_popular_sciences.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
       
    @all_popular_sciences = PopularScience.all

    @popular_sciences = @all_popular_sciences

    if !year.blank?
      if year != 'todos'
        @popular_sciences = @popular_sciences.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @popular_sciences = @popular_sciences.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @popular_sciences = @popular_sciences.order(last_date: :desc)

    min_date = @all_popular_sciences.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'org'
  end

  def show
    layout = 'org'
    layout = 'profile' if !@person.blank? 
    render :layout => layout
  end

  def new
    @popular_science = PopularScience.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @popular_science = PopularScience.new
    @popular_science.name = params[:name]
    @popular_science.activity_type  = params[:activity_type]
    @popular_science.start_date  = params[:start_date]
    @popular_science.end_date = params[:end_date]
    @popular_science.location = params[:location]
    @popular_science.description = params[:description]
    @popular_science.country_id = params[:country_id]
    @popular_science.person_id  = current_user.id
    @popular_science.last_date = params[:end_date]

    if @popular_science.save
      log = @popular_science.activity_logs.new 
      log.message = "Difusión y Divulgación agregado"
      log.person_id = current_user.id
      log.save
      render json: @popular_science
    else 
       puts @popular_science.errors.full_messages
    end
  end

  def update
    respond_to do |format|

      if @popular_science.update(popular_science_params)
        changes = @popular_science.changes
        @popular_science.last_date = @popular_science.end_date
    
        @popular_science.save

        log = @popular_science.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Difusión y Divulgación #{@popular_science.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_popular_science_path(@person.shortname, @popular_science.id), notice: 'Difusión y Divulgación ha sido actualizado' }
        format.json { render :show, status: :ok, location: @popular_science }
      else
        format.html { render :edit }
        format.json { render json: @popular_science.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @popular_science.destroy
    respond_to do |format|
      format.html { redirect_to popular_sciences_url, notice: 'Difusión y Divulgación ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private

    def set_popular_science
      @popular_science = PopularScience.find(params[:id])
    end

    def popular_science_params
      params.require(:popular_science).permit(:name, :description, :start_date, :end_date, :activity_type, :location, :country_id, :person_id)
    end
end

