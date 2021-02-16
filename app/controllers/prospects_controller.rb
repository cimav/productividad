class ProspectsController < ApplicationController
  before_action :auth_required

  before_action :set_prospect, only: [:org_show, :information, :change_status, :change_status_save, :assign, :create_team, :admin, :show, :edit, :update, :destroy, :budget, :messages, :tasks, :calendar, :services, :participants, :documents]
  before_action :set_person
  before_action :set_department

  def index

    year = params[:year]
 
    @filter_status = params[:status] 

    case @filter_status
      when "en-definicion"
        status = prospect::DEFINITION
      when "en-negociacion"
        status = prospect::NEGOTIATION
      when "en-proceso"
        status = prospect::IN_PROCESS
      when "concluidos"
        status = prospect::CONCLUDED
      when "suspendidos"
        status = prospect::SUSPENDED
      when "cancelados"
        status = prospect::CANCELED
      when "rechazados"
        status = prospect::REJECTED
      else
        @filter_status = 'todos'
    end
      
    @all_prospects = Prospect.left_outer_joins(:prospect_participants).where("(prospect_participants.person_id=? AND prospect_participants.status=?) OR (prospects.person_id = ?)", @person.id, ProspectParticipant::ACTIVE, @person.id).group('prospects.id') 

    @prospects = @all_prospects


    if params[:status] == 'todos'
      if !year.blank?
        @prospects = @prospects.where("YEAR(contact_date) <= ?", year)
      end
    elsif !status.blank? && !year.blank?
      @prospects = @prospects.where("prospects.status = ? AND YEAR(contact_date) <= ?", status, year)
    elsif !status.blank?
      @prospects = @prospects.where("prospects.status = ?", status)
    else
      year = Date.today.year
      @prospects = @prospects.where("YEAR(contact_date) <= ?", year)
    end

    @filter_year = year

    @prospects = @prospects.order(code: :desc)

    min_date = @all_prospects.minimum(:contact_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'profile'
  end

  def org_index

    year = params[:year]
 
    @filter_status = params[:status] 

    case @filter_status
      when "en-definicion"
        status = prospect::DEFINITION
      when "en-negociacion"
        status = prospect::NEGOTIATION
      when "en-proceso"
        status = prospect::IN_PROCESS
      when "concluidos"
        status = prospect::CONCLUDED
      when "suspendidos"
        status = prospect::SUSPENDED
      when "cancelados"
        status = prospect::CANCELED
      when "rechazados"
        status = prospect::REJECTED
      else
        @filter_status = 'todos'
    end
      
    @all_prospects = Prospect.all

    @prospects = @all_prospects


    if params[:status] == 'todos'
      if !year.blank?
        @prospects = @prospects.where("YEAR(contact_date) <= ?", year)
      end
    elsif !status.blank? && !year.blank?
      @prospects = @prospects.where("prospects.status = ? AND YEAR(contact_date) <= ?", status, year)
    elsif !status.blank?
      @prospects = @prospects.where("prospects.status = ?", status)
    else
      year = Date.today.year
      @prospects = @prospects.where("YEAR(contact_date) <= ?", year)
    end

    @filter_year = year

    @prospects = @prospects.order(code: :desc)

    min_date = @all_prospects.minimum(:contact_date)
    
    @min_year = min_date.year rescue year

    render :layout => 'org'
  end

  def department_index
    render :inline => 'EN DESARROLLO'
  end

  def change_status
    @prospect_status_change = @prospect.prospect_status_changes.new
    render :layout => 'profile'
  end

  def change_status_save
    @prospect_status_change = @prospect.prospect_status_changes.new(prospect_status_change_params)
    @prospect_status_change.from = @prospect.status
    @prospect_status_change.person_id = current_user.id
    @prospect_status_change.status = ProspectStatusChange::ACTIVE
    if @prospect_status_change.save 
      @prospect.status = @prospect_status_change.to
      @prospect.save
      redirect_to prospect_path(@person.shortname, @prospect.id), notice: "El prospecto de proyecto cambio de estado a #{@prospect.status_text}"
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
    @prospect = Prospect.new
    render :layout => 'profile'
  end

  def edit
    render :layout => 'profile'
  end

  def create
    @prospect = Prospect.new

    @prospect.subject         = params[:subject]
    @prospect.organization    = params[:organization]
    @prospect.contact_date    = params[:contact_date]
    @prospect.decision_type   = params[:decision_type]
    @prospect.contact         = params[:contact]
    @prospect.phone           = params[:phone]
    @prospect.email           = params[:email]
    @prospect.address         = params[:address]
    @prospect.country_id      = params[:country_id]
    @prospect.source          = params[:source]
    @prospect.needs           = params[:needs]
    @prospect.person_id       = current_user.id
    @prospect.status          = Prospect::INITIAL

    if @prospect.save
      status_initial = @prospect.prospect_status_changes.new
      status_initial.from = Prospect::INITIAL
      status_initial.to = Prospect::INITIAL
      status_initial.change_date = @prospect.contact_date
      status_initial.person_id = current_user.id
      status_initial.status = ProspectStatusChange::ACTIVE
      status_initial.save

      ProspectsMailer.new_prospect(@prospect).deliver_now


      log = @prospect.activity_logs.new 
      log.message = "Prospecto de proyecto agregado: #{@prospect.subject}"
      log.person_id = current_user.id
      log.save
      render json: @prospect
    end
  end

  def update
    respond_to do |format|

      if @prospect.update(prospect_params)
        changes = @prospect.changes
        @prospect.save

        log = @prospect.activity_logs.new
        log.person_id = current_user.id
        log.changed_values = changes.to_json
        log.message = "El prospecto de proyecto #{@prospect.id} ha sido actualizado."
        log.save
          
        format.html { redirect_to prospect_path(@person.shortname, @prospect.id), notice: 'El prospecto de proyecto ha sido actualizado' }
        format.json { render :show, status: :ok, location: @prospect }
      else
        format.html { render :edit }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prospect.status = Prospect::DELETED
    respond_to do |format|
      format.html { redirect_to prospects_url, notice: 'El prospecto de proyecto ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  def assign
    render :layout => 'profile'
  end

  def create_team 
    respond_to do |format|
      params.each do |k,v|
        if k.start_with?('team_')
          team = @prospect.prospect_teams.new
          team.person_id = "#{k}".sub! 'team_', ''
          team.participant_type = v
          team.save
        end 
      end
      status_assigned = @prospect.prospect_status_changes.new
      status_assigned.from = @prospect.status
      status_assigned.to = Prospect::ASSIGNED
      status_assigned.change_date = DateTime.now
      status_assigned.person_id = current_user.id
      status_assigned.status = ProspectStatusChange::ACTIVE
      status_assigned.save

      @prospect.status = Prospect::ASSIGNED
      @prospect.save

      ProspectsMailer.team_created(@prospect).deliver_now


      log = @prospect.activity_logs.new 
      log.message = "Se asignó el equipo al prospecto"
      log.person_id = current_user.id
      log.save
      format.html { redirect_to prospect_path(@person.shortname, @prospect.id), notice: 'El equipo ha sido designado' }
      format.json { render :show, status: :ok, location: @prospect }
    end

  end

  def go_to
    @prospect = Prospect.find_by_code(params[:code])
    redirect_to prospect_path(current_user.shortname, @prospect.id)
  end


  private

    def set_prospect
      @prospect = Prospect.find(params[:id])
    end

    def prospect_params
      params.require(:prospect).permit(:subject, :organization, :contact_date, :contact, :decision_type, :phone, :email, :address, :country_id, :source, :needs, :status)
    end

    def prospect_status_change_params
      params.require(:prospect_status_change).permit(:change_date, :content, :to, :status)
    end

end
