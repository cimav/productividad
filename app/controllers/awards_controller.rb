class AwardsController < ApplicationController
  before_action :auth_required

  before_action :set_award, only: [:show, :edit, :update, :destroy]
  before_action :set_person

  def index

    year = params[:year]
       
    @all_awards = Award.where("awards.person_id = ?", @person.id)

    @awards = @all_awards

    if !year.blank?
      if year != 'todos'
        @awards = @awards.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @awards = @awards.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @awards = @awards.order(last_date: :desc)

    min_date = @all_awards.minimum(:last_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
       
    @all_awards = Award.all

    @awards = @all_awards

    if !year.blank?
      if year != 'todos'
        @awards = @awards.where("YEAR(last_date) = ?", year)
      end
    else
      year = Date.today.year
      @awards = @awards.where("YEAR(last_date) = ?", year)
    end

    @filter_year = year

    @awards = @awards.order(last_date: :desc)

    min_date = @all_awards.minimum(:last_date)
    
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
    @award = Award.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @award = Award.new
    @award.name = params[:name]
    @award.award_type  = params[:award_type]
    @award.granted_by  = params[:granted_by]
    @award.grant_date = params[:grant_date]
    @award.country_id = params[:country_id]
    @award.person_id  = current_user.id
    @award.last_date = params[:grant_date]

    if @award.save
      log = @award.activity_logs.new 
      log.message = "Reconocimiento agregado"
      log.person_id = current_user.id
      log.save
      render json: @award
    else 
       puts @award.errors.full_messages
    end
  end

  def update
    respond_to do |format|

      if @award.update(award_params)
        changes = @award.changes
        @award.last_date = @award.grant_date
    
        @award.save

        log = @award.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "Reconocimiento #{@award.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to edit_award_path(@person.shortname, @award.id), notice: 'Reconocimiento ha sido actualizado' }
        format.json { render :show, status: :ok, location: @award }
      else
        format.html { render :edit }
        format.json { render json: @award.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @award.destroy
    respond_to do |format|
      format.html { redirect_to awards_url, notice: 'Reconocimiento ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_award
      @award = Award.find(params[:id])
    end

    def award_params
      params.require(:award).permit(:name, :granted_by, :grant_date, :award_type, :country_id, :person_id)
    end
end
